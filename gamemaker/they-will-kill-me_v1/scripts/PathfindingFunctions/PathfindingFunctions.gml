/// @function							find_path(path_grid,start_point_str,goal_point_str);
/// @param	{index}	path_grid			Pathfinding grid
/// @param	{array}	start_point_str		The starting point string
/// @param	{array}	goal_point_str		The goal point string

function find_path(path_grid,start_point_str,goal_point_str)
{
	// Add first point to queue and set grid
	var frontier = ds_priority_create();
	var goal_x = convert_str_to_point(goal_point_str,0);
	var goal_y = convert_str_to_point(goal_point_str,1);
	
	ds_priority_add(frontier,start_point_str,0);
	ds_grid_set(path_grid,convert_str_to_point(start_point_str,0),convert_str_to_point(start_point_str,1),1);
	
	while (!ds_priority_empty(frontier))
	{
		// Get point/value from frontier
		var curr_point_str = ds_priority_delete_min(frontier);
		var curr_x = convert_str_to_point(curr_point_str,0);
		var curr_y = convert_str_to_point(curr_point_str,1);
		var curr_val = ds_grid_get(path_grid,curr_x,curr_y);
		
		// If goal is found
		if (curr_x == goal_x && curr_y == goal_y)
		{
			// Build path
			build_path(path_grid,goal_x,goal_y);
			break;
		}
		
		// Check Right/Left
		for (var i=1; i>-2; i-=2)
		{
			// Fall Variables Reset
			var n = 1;
			var a;
		
			// Check Right/Left
			if (ds_grid_get(path_grid,curr_x+i,curr_y) == 0 && ds_grid_get(path_grid,curr_x+i,curr_y+1) == -1)
			{
				ds_grid_set(path_grid,curr_x+i,curr_y,curr_val+1);
				var priority = heuristic(goal_x,goal_y,curr_x+i,curr_y);
				ds_priority_add(frontier,convert_point_to_str(curr_x+i,curr_y),priority);
			}
			else
			{
				// Check One Block Jump Right/Left
				if (ds_grid_get(path_grid,curr_x+i,curr_y) == -1 && ds_grid_get(path_grid,curr_x+i,curr_y-1) == 0)
				{
					ds_grid_set(path_grid,curr_x+i,curr_y-1,curr_val+1);
					var priority = heuristic(goal_x,goal_y,curr_x+i,curr_y-1);
					ds_priority_add(frontier,convert_point_to_str(curr_x+i,curr_y-1),priority);
				}
				else
				{
					// Check One Block Large Jump Right/Left
					if (ds_grid_get(path_grid,curr_x+i,curr_y) == 0 && ds_grid_get(path_grid,curr_x+i+i,curr_y) == -1 && ds_grid_get(path_grid,curr_x+i+i,curr_y-1) == 0)
					{
						ds_grid_set(path_grid,curr_x+i+i,curr_y-1,curr_val+1);
						var priority = heuristic(goal_x,goal_y,curr_x+i+i,curr_y-1);
						ds_priority_add(frontier,convert_point_to_str(curr_x+i+i,curr_y-1),priority);
					}
				
					// Check Void Jump Right/Left
					if (ds_grid_get(path_grid,curr_x+i,curr_y) == 0 && ds_grid_get(path_grid,curr_x+i+i,curr_y) == 0 && ds_grid_get(path_grid,curr_x+i+i,curr_y+1) == -1)
					{
						ds_grid_set(path_grid,curr_x+i+i,curr_y,curr_val+1);
						var priority = heuristic(goal_x,goal_y,curr_x+i+i,curr_y);
						ds_priority_add(frontier,convert_point_to_str(curr_x+i+i,curr_y),priority);
					}
				
					// Check Fall Right/Left
					if (ds_grid_get(path_grid,curr_x+i,curr_y) == 0 && ds_grid_get(path_grid,curr_x+i,curr_y+1) == 0)
					{
						do
						{
							n += 1;
							a = ds_grid_get(path_grid,curr_x+i,curr_y+n);
						}
						until (a == -1 || curr_y+n == ds_grid_height(path_grid))
					
						// Check Floor On Fall
						if (ds_grid_get(path_grid,curr_x+i,curr_y+n-1) == 0 && ds_grid_get(path_grid,curr_x+i,curr_y+n) == -1)
						{
							ds_grid_set(path_grid,curr_x+i,curr_y+n-1,curr_val+1);
							var priority = heuristic(goal_x,goal_y,curr_x+i,curr_y+n-1);
							ds_priority_add(frontier,convert_point_to_str(curr_x+i,curr_y+n-1),priority);
						}
					}
				}
			}
		}
	}
	
	ds_priority_destroy(frontier);
}


/// @function					build_path(path_grid,xgoal,ygoal);
/// @param	{index}	path_grid	Pathfinding grid
/// @param	{real}  xgoal		The ending x
/// @param	{real}  ygoal		The ending y

function build_path(path_grid,xgoal,ygoal)
{
	pathway = path_add();
	var x_previous;
	
	// Fall Variables
	var a = -1;
	var b = -1;
	var n = 0;
	
	// First point in path
	var _x = xgoal*oGrid.cell_width+(oGrid.cell_width/2), _y = ygoal*oGrid.cell_height+(oGrid.cell_height/2);
	path_add_point(pathway,_x,_y,100);
	var last_value = ds_grid_get(path_grid,xgoal,ygoal);
	
	for (var i=last_value-1; i>1; i-=1)
	{
		x_previous = xgoal;
		n=0;
		
		// Check One Block Jump Right/Left
		if (ds_grid_value_exists(path_grid,xgoal-1,ygoal,xgoal+1,ygoal+1,i))
		{
			xgoal = ds_grid_value_x(path_grid,xgoal-1,ygoal,xgoal+1,ygoal+1,i);
			ygoal = ds_grid_value_y(path_grid,x_previous-1,ygoal,x_previous+1,ygoal+1,i);
			path_add_point(pathway,xgoal*oGrid.cell_width+(oGrid.cell_width/2),ygoal*oGrid.cell_height+(oGrid.cell_height/2),100);
		}
		else
		{
			// Check One Block Large Jump/Void Jump Right/Left
			if (ds_grid_value_exists(path_grid,xgoal-2,ygoal,xgoal+2,ygoal+1,i))
			{
				xgoal = ds_grid_value_x(path_grid,xgoal-2,ygoal,xgoal+2,ygoal+1,i);
				
				// Check If Can Jump
				if (ds_grid_get(path_grid,x_previous+sign(xgoal-x_previous),ygoal) == 0)
				{
					ygoal = ds_grid_value_y(path_grid,x_previous-2,ygoal,x_previous+2,ygoal+1,i);
					path_add_point(pathway,xgoal*oGrid.cell_width+(oGrid.cell_width/2),ygoal*oGrid.cell_height+(oGrid.cell_height/2),100);
				}
				else
				{
					// Collision to Fall
					do
					{
						n += 1;
						a = ds_grid_get(path_grid,x_previous-1,ygoal-n);
						b = ds_grid_get(path_grid,x_previous+1,ygoal-n);
					}
					until (a == i || b == i || (ygoal-n) < 0)
					
					if (ds_grid_value_exists(path_grid,x_previous-1,ygoal-n,x_previous+1,ygoal-n,i))
					{
						xgoal = ds_grid_value_x(path_grid,x_previous-1,ygoal-n,x_previous+1,ygoal,i);
						ygoal = ds_grid_value_y(path_grid,x_previous-1,ygoal-n,x_previous+1,ygoal,i);
						path_add_point(pathway,xgoal*oGrid.cell_width+(oGrid.cell_width/2),ygoal*oGrid.cell_height+(oGrid.cell_height/2),100)
					}
				}
			}
			else
			{
				// Fall
				do
				{
					n += 1;
					a = ds_grid_get(path_grid,x_previous-1,ygoal-n);
					b = ds_grid_get(path_grid,x_previous+1,ygoal-n);
				}
				until (a == i || b == i || (ygoal-n) < 0)
				
				if (ds_grid_value_exists(path_grid,x_previous-1,ygoal-n,x_previous+1,ygoal-n,i))
				{
					xgoal = ds_grid_value_x(path_grid,x_previous-1,ygoal-n,x_previous+1,ygoal,i);
					ygoal = ds_grid_value_y(path_grid,x_previous-1,ygoal-n,x_previous+1,ygoal,i);
					path_add_point(pathway,xgoal*oGrid.cell_width+(oGrid.cell_width/2),ygoal*oGrid.cell_height+(oGrid.cell_height/2),100)
				}
			}
		}
	}
	
	path_add_point(pathway,floor(x/oGrid.cell_width)*oGrid.cell_width+(oGrid.cell_width/2),floor(y/oGrid.cell_height)*oGrid.cell_height+(oGrid.cell_height/2),100);
	path_set_closed(pathway,false);
	path_reverse(pathway);
}


/// @function					follow_path(path_way);
/// @param	{index}	path_way		Path points

function follow_path(path_way)
{
	var point_count = path_get_number(path_way);
	var path_dir = sign(path_get_point_x(path_way,path_point+1)-path_get_point_x(path_way,path_point));
	
	if (alarm[3] == -1)
	{
		alarm[3] = 120;
	}
	
	if (action == 0)
	{	
		// Check If Next Point Is Move Right/Left
		if (path_get_point_y(path_way,path_point) == path_get_point_y(path_way,path_point+1) &&
			path_get_point_x(path_way,path_point)+oGrid.cell_width*path_dir == path_get_point_x(path_way,path_point+1))
		{
			hspd = walk_spd * path_dir;
			action = 1;
		}
		else
		{
			// Check If Next Point Is Void Jump
			if (path_get_point_y(path_way,path_point) == path_get_point_y(path_way,path_point+1) &&
				path_get_point_x(path_way,path_point)+2*oGrid.cell_width*path_dir == path_get_point_x(path_way,path_point+1))
			{
				hspd = walk_spd * path_dir;
				if (place_meeting(x,y+1,oWall))
				{
					vspd = jump_spd * 0.55;
				}
				if (x <= path_get_point_x(path_way,path_point+1) && path_get_point_x(path_way,path_point+1) < (x+hspd*path_dir))
				{
					hspd = 0;
					action = 1;
				}
			}
			else
			{
				// Check If Next Point Is Fall
				if (path_get_point_y(path_way,path_point) < path_get_point_y(path_way,path_point+1))
				{
					hspd = walk_spd * path_dir;
					if (x <= path_get_point_x(path_way,path_point+1) && path_get_point_x(path_way,path_point+1) < (x+hspd*path_dir))
					{
						action = 1;
						hspd = 0;
						x = path_get_point_x(path_way,path_point+1);
					}
				}
				else
				{
					// Check If Next Point Is One Block Large Jump
					if (path_get_point_x(path_way,path_point) == path_get_point_x(path_way,path_point+1)-2*oGrid.cell_width*path_dir &&
						path_get_point_y(path_way,path_point) == path_get_point_y(path_way,path_point+1)+oGrid.cell_height)
					{
						hspd = walk_spd * path_dir;
						vspd = jump_spd * 0.9;
						action = 1;
					}
					else
					{
						// Check If Next Point Is One Block Jump
						if (path_get_point_y(path_way,path_point) == path_get_point_y(path_way,path_point+1)+oGrid.cell_height &&
							path_get_point_x(path_way,path_point)+oGrid.cell_width*path_dir == path_get_point_x(path_way,path_point+1))
						{
							hspd = walk_spd * path_dir;
							if (place_meeting(x,y+1,oWall) && jump_action == 0)
							{
								vspd = jump_spd;
								jump_action = 1;
								hspd = walk_spd * path_dir;
							}
						}
					}
				}
			}
		}
	}
	// Check If Reached Next Point
	//if (x <= path_get_point_x(path_way,path_point+1) && path_get_point_x(path_way,path_point+1) <= x+hspd*path_dir &&
	//	path_get_point_y(path_way,path_point+1) == y-sprite_yoffset-(oGrid.cell_height/2-sprite_height))
	if (distance_to_point(path_get_point_x(path_way,path_point+1),path_get_point_y(path_way,path_point+1)) < 8 ||
		(x <= path_get_point_x(path_way,path_point+1) && path_get_point_x(path_way,path_point+1) < (x+hspd*path_dir) && distance_to_point(path_get_point_x(path_way,path_point+1),path_get_point_y(path_way,path_point+1)) < 16))
	{
		path_point += 1;
		action = 0;
		jump_action = 0;
		
		alarm[3] = 120;
		
		// If Last Point
		if (path_point == point_count-1)
		{
			hspd = 0;
			vspd = 0;
			path_delete(path_way);
			path_point = 0;
			
			alarm[3] = -1;
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