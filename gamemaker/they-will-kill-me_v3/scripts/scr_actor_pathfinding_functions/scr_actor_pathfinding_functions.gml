/// @func	actor_find_move_actions(x,y,goal_x,goal_y,val,frontier);
/// @desc	Checks the movement actions of actor and updates priority queue.
function actor_find_move_actions(_x,_y,_goal_x,_goal_y,_val,_frontier)
{
	// Check right/left actions
	for (var i=1;i>-2;i-=2)
	{
		// Check move right/left
		if (ds_grid_get(my_pathfinding_grid,_x+i,_y) == 0 &&	// 1st right/left cell empty
			ds_grid_get(my_pathfinding_grid,_x+i,_y+1) == -1)	// 1st right/left cell grounded
		{
			update_path_grid(_x+i,_y,_goal_x,_goal_y,_val,_frontier);
		}
		else
		{
			// Check one block jump right/left
			if (ds_grid_get(my_pathfinding_grid,_x+i,_y) == -1 &&	// 1st up diagonal right/left cell grounded
				ds_grid_get(my_pathfinding_grid,_x+i,_y-1) == 0)	// 1st up diagonal right/left cell empty
			{
				update_path_grid(_x+i,_y-1,_goal_x,_goal_y,_val,_frontier);
			}
			else
			{
				// Check fall right/left
				if (ds_grid_get(my_pathfinding_grid,_x+i,_y) == 0 &&	// 1st right/left cell empty
					ds_grid_get(my_pathfinding_grid,_x+i,_y+1) == 0)	// 1st down diagonal right/left cell empty
				{
					// Figure out how deep fall is and set n to that depth
					var _n = 1;
					while (true)
					{
						_n++;
						if (ds_grid_get(my_pathfinding_grid,_x+i,_y+_n) == -1 ||	// Hit a wall
							_y+_n == ds_grid_height(my_pathfinding_grid))			// Hit lower bounds
						{
							break;
						}
					}
					
					// Check floor on fall
					if (ds_grid_get(my_pathfinding_grid,_x+i,_y+_n-1) == 0 &&	// Fall spot empty
						ds_grid_get(my_pathfinding_grid,_x+i,_y+_n) == -1)		// Fall spot grounded
					{
						update_path_grid(_x+i,_y+_n-1,_goal_x,_goal_y,_val,_frontier);
					}
				}
			}
		}
	}
}


/// @func	actor_build_move_actions(x,y,val,x_prev);
/// @desc	Checks the movement actions of actor and updates path.
function actor_build_move_actions(_x,_y,_val)
{
	// New x and y to be returned by function
	var _new_x, _new_y;
	
	// Check right/left + one block jump right/left
	if (ds_grid_value_exists(my_pathfinding_grid,_x-1,_y,_x+1,_y+1,_val))
	{
		_new_x = ds_grid_value_x(my_pathfinding_grid,_x-1,_y,_x+1,_y+1,_val);
		_new_y = ds_grid_value_y(my_pathfinding_grid,_x-1,_y,_x+1,_y+1,_val);
		return (convert_point_to_str(_new_x,_new_y));
	}
	else
	{
		// Check fall right/left
		var n = 0;
		while (true)
		{
			n++;
			if (ds_grid_get(my_pathfinding_grid,_x-1,_y-n) == _val ||
				ds_grid_get(my_pathfinding_grid,_x+1,_y-n) == _val ||
				_y-n < 0)
			{
				break;
			}
		}
				
		// Check floor on fall
		if (ds_grid_value_exists(my_pathfinding_grid,_x-1,_y-n,_x+1,_y-n,_val))
		{
			_new_x = ds_grid_value_x(my_pathfinding_grid,_x-1,_y-n,_x+1,_y,_val);
			_new_y = ds_grid_value_y(my_pathfinding_grid,_x-1,_y-n,_x+1,_y,_val);
			return (convert_point_to_str(_new_x,_new_y));
		}
	}
	
	// Return new X/Y as a string
	return ("ERROR");
}


/// @func	actor_follow_move_actions(x,y,goal_x,goal_y,val,frontier);
/// @desc	Checks the movement actions of actor and updates priority queue.
function actor_follow_move_actions()
{
	var _path_dir_x = sign(path_get_point_x(curr_path,curr_path_point+1)-path_get_point_x(curr_path,curr_path_point));
	
	// Check if next action is walk right/left
	if (path_get_point_y(curr_path,curr_path_point) == path_get_point_y(curr_path,curr_path_point+1) &&
		path_get_point_x(curr_path,curr_path_point)+obj_grid.cell_width*_path_dir_x == path_get_point_x(curr_path,curr_path_point+1))
	{
		actor_input(ActorInput.RUN,_path_dir_x);
	}
	// Check if next action is one block jump right/left
	else if (path_get_point_y(curr_path,curr_path_point)-obj_grid.cell_height == path_get_point_y(curr_path,curr_path_point+1) &&
			 path_get_point_x(curr_path,curr_path_point)+obj_grid.cell_width*_path_dir_x == path_get_point_x(curr_path,curr_path_point+1))
	{
		actor_input(ActorInput.JUMP,_path_dir_x);
	}
	// Check if next point is fall right/left
	else if (path_get_point_y(curr_path,curr_path_point) < path_get_point_y(curr_path,curr_path_point+1))
	{
		actor_input(ActorInput.FALL,_path_dir_x);
	}
}