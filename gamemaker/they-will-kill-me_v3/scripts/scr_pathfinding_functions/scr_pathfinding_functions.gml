/// @func	agent_init(move_actions_find,move_actions_build,move_actions_follow,_action_inputs);
/// @desc	Initilize the variables required for pathfinding.
function agent_init(_move_actions_find,_move_actions_build,_move_actions_follow,_action_inputs)
{
	my_pathfinding_grid = noone;
	move_actions_find = _move_actions_find;
	move_actions_build = _move_actions_build;
	move_actions_follow = _move_actions_follow;
	action_inputs = _action_inputs;
	query_path = false;
	curr_path = noone;
	curr_path_point = 0;
}


/// @func	pathfinding_execute();
/// @desc	Executes pathfinding logic.

function pathfinding_execute()
{
	// Check if looking for a new path
	if (query_path)
	{
		find_path(x,y,my_brain.goal_x,my_brain.goal_y);
	}
	
	// Check if a path exists
	if (path_exists(curr_path))
	{
		follow_path();
	}
}


/// @func	find_path(x1,y1,x2,y2);
/// @desc	Tries to find a traversable path, then calls build path if one exists
function find_path(_x1,_y1,_x2,_y2)
{
	// Clear path
	if (path_exists(curr_path))
	{
		path_delete(curr_path);
	}
	curr_path_point = 0;
	
	// Stop controls
	action_inputs(0,0);
	
	// Copy grid
	if (!ds_exists(my_pathfinding_grid,ds_type_grid))
	{
		my_pathfinding_grid = ds_grid_create(ds_grid_width(global.pathfinding_grid),ds_grid_height(global.pathfinding_grid));
	}
	ds_grid_copy(my_pathfinding_grid,global.pathfinding_grid);
	
	// Convert world coordinates to grid coordinates
	var _start_x = floor(_x1/obj_grid.cell_width), _start_y = floor(_y1/obj_grid.cell_height);
	var _goal_x = floor(_x2/obj_grid.cell_width), _goal_y = floor(_y2/obj_grid.cell_height);
	
	// Create priority queue
	var _frontier = ds_priority_create();
	
	// Add first point to priority queue and set grid
	ds_priority_add(_frontier,convert_point_to_str(_start_x,_start_y),0);
	ds_grid_set(my_pathfinding_grid,_start_x,_start_y,1);
	
	while (!ds_priority_empty(_frontier))
	{
		// Get point/value from frontier
		var _curr_point_str = ds_priority_delete_min(_frontier);
		var _curr_x = convert_str_to_point(_curr_point_str,0);
		var _curr_y = convert_str_to_point(_curr_point_str,1);
		var _curr_val = ds_grid_get(my_pathfinding_grid,_curr_x,_curr_y);
		
		// Check if goal was found
		if (_curr_x == _goal_x && _curr_y == _goal_y)
		{
			// Build path
			build_path(_goal_x,_goal_y);
			break;
		}
		
		// Check movement actions
		move_actions_find(_curr_x,_curr_y,_goal_x,_goal_y,_curr_val,_frontier);
	}
	
	// Destroy priority queue
	ds_priority_destroy(_frontier);
}


/// @func	build_path(goal_x,goal_y);
/// @desc	Builds a path traversable by an agent.
function build_path(_goal_x,_goal_y)
{
	// Create empty path
	curr_path = path_add();
	
	// Add first point (goal point) to path
	var _x = _goal_x * obj_grid.cell_width + (obj_grid.cell_width/2), _y = _goal_y * obj_grid.cell_height + (obj_grid.cell_height/2);
	path_add_point(curr_path,_x,_y,100);
	var _last_val = ds_grid_get(my_pathfinding_grid,_goal_x,_goal_y);
	
	for (var i=_last_val-1;i>1;i--)
	{
		// Check movement actions
		var _next_str = move_actions_build(_goal_x,_goal_y,i);
		if (_next_str != "ERROR")
		{
			var _next_x = convert_str_to_point(_next_str,0), _next_y = convert_str_to_point(_next_str,1);
			
			// Update goal X/Y and X/Y
			_goal_x = _next_x;
			_goal_y = _next_y;
			_x = _goal_x * obj_grid.cell_width + (obj_grid.cell_width/2);
			_y = _goal_y * obj_grid.cell_height + (obj_grid.cell_height/2);
		
			// Add point to path
			path_add_point(curr_path,_x,_y,100);
		}
		else
		{
			show_debug_message("ERROR: Could not build path.")
			break;
		}
	}
	
	// Add last point (start point) to path
	path_add_point(curr_path,floor(x/obj_grid.cell_width)*obj_grid.cell_width+(obj_grid.cell_width/2),
							 floor(y/obj_grid.cell_height)*obj_grid.cell_height+(obj_grid.cell_height/2),100);
	
	// Close and reverse path
	path_set_closed(curr_path,false);
	path_reverse(curr_path);
	
	// Close query
	query_path = false;
}


/// @func	follow_path();
/// @desc	Follows a prebuilt path.
function follow_path()
{
	// Get point count and path direction
	var _point_cnt = path_get_number(curr_path);
	
	// Follow path
	move_actions_follow();
	
	// Check if reached next point
	if (distance_to_point(path_get_point_x(curr_path,curr_path_point+1),path_get_point_y(curr_path,curr_path_point+1)) < 2 &&	// Close enough to point
		place_meeting(x,y+1,obj_wall))																							// Grounded
	{
		// Advance to next point
		curr_path_point++;
		
		// Check if last point
		if (curr_path_point == _point_cnt-1)
		{
			curr_path_point = 0;
			path_delete(curr_path);
			
			// Stop controls
			action_inputs(0,0);
			
			// End goal
			my_brain.goal_exists = false;
		}
	}
}


/// @function				heuristic(x1,y1,x2,y2);
/// @param	{real}	x1		Start X
/// @param	{real}	y1		Start Y
/// @param	{real}	x2		End X
/// @param	{real}	y2		End Y
/// @description			Returns Manhattan distance on a square grid (For priority)

function heuristic(x1,y1,x2,y2)
{
	return (abs(x1-x2)+abs(y1-y2));
}


/// @func	update_path_grid(x,y,goal_x,goal_y,val,frontier);
/// @desc	Updates current pathfinding grid.
function update_path_grid(_x,_y,_goal_x,_goal_y,_val,_frontier)
{
	ds_grid_set(my_pathfinding_grid,_x,_y,_val+1);
	var _priority = heuristic(_goal_x,_goal_y,_x,_y);
	ds_priority_add(_frontier,convert_point_to_str(_x,_y),_priority);
}