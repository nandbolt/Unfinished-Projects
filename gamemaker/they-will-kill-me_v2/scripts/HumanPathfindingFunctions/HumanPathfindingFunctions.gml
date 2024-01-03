/// @function							human_find_path(path_grid,start_point_str,goal_point_str);
/// @param	{index}	path_grid			Pathfinding grid
/// @param	{array}	start_point_str		The starting point string
/// @param	{array}	goal_point_str		The goal point string
/// @description						Finds a traversable path, then calls the build path if one exists.

function human_find_path(path_grid,start_point_str,goal_point_str)
{
	// Create priority queue, convert goal_point_str (string) => (real)
	var frontier = ds_priority_create();
	var goal_x = convert_str_to_point(goal_point_str,0);
	var goal_y = convert_str_to_point(goal_point_str,1);
	
	// Add first point to priority queue and set grid
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
			human_build_path(path_grid,goal_x,goal_y);
			break;
		}
		
		// Check movement actions
		for (var i=1; i>-2; i-=2)
		{
			// Check move right/left
			if (ds_grid_get(path_grid,curr_x+i,curr_y) == 0 &&	// 1st right/left cell empty
				ds_grid_get(path_grid,curr_x+i,curr_y+1) == -1)	// 1st right/left cell grounded
			{
				ds_grid_set(path_grid,curr_x+i,curr_y,curr_val+1);
				var priority = heuristic(goal_x,goal_y,curr_x+i,curr_y);
				ds_priority_add(frontier,convert_point_to_str(curr_x+i,curr_y),priority);
			}
			else
			{
				// Check one block jump right/left + exit water right/left
				if (ds_grid_get(path_grid,curr_x+i,curr_y) == -1 &&		// 1st diagonal right/left cell grounded
					ds_grid_get(path_grid,curr_x+i,curr_y-1) == 0)		// 1st diagonal right/left cell empty
				{
					ds_grid_set(path_grid,curr_x+i,curr_y-1,curr_val+1);
					var priority = heuristic(goal_x,goal_y,curr_x+i,curr_y-1);
					ds_priority_add(frontier,convert_point_to_str(curr_x+i,curr_y-1),priority);
				}
				else
				{
					// Check one block large jump up right/left
					if (ds_grid_get(path_grid,curr_x+i,curr_y) == 0 &&		// 1st right/left cell empty
						ds_grid_get(path_grid,curr_x+i+i,curr_y) == -1 &&	// 2nd diagonal right/left cell grounded
						ds_grid_get(path_grid,curr_x+i+i,curr_y-1) == 0)	// 2nd diagonal right/left cell empty
					{
						ds_grid_set(path_grid,curr_x+i+i,curr_y-1,curr_val+1);
						var priority = heuristic(goal_x,goal_y,curr_x+i+i,curr_y-1);
						ds_priority_add(frontier,convert_point_to_str(curr_x+i+i,curr_y-1),priority);
					}
					// Check void jump right/left
					if (ds_grid_get(path_grid,curr_x+i,curr_y) == 0 &&		// 1st right/left cell empty
						ds_grid_get(path_grid,curr_x+i+i,curr_y) == 0 &&	// 2nd right/left cell empty
						ds_grid_get(path_grid,curr_x+i+i,curr_y+1) == -1)	// 2nd right/left cell grounded
					{
						ds_grid_set(path_grid,curr_x+i+i,curr_y,curr_val+1);
						var priority = heuristic(goal_x,goal_y,curr_x+i+i,curr_y);
						ds_priority_add(frontier,convert_point_to_str(curr_x+i+i,curr_y),priority);
					}
					// Check fall right/left
					if (ds_grid_get(path_grid,curr_x+i,curr_y) == 0 &&		// 1st right/left cell empty
						ds_grid_get(path_grid,curr_x+i,curr_y+1) == 0)		// 1st right/left cell not grounded
					{
						// Figure out how deep the fall is and set n to that depth
						var n = 1;
						while (true)
						{
							n++;
							if (ds_grid_get(path_grid,curr_x+i,curr_y+n) == -1 ||	// Wall
								ds_grid_get(path_grid,curr_x+i,curr_y+n) == -2 ||	// Water
								curr_y+n == ds_grid_height(path_grid))
							{
								break;
							}
						}
				
						// Check floor on fall
						if (ds_grid_get(path_grid,curr_x+i,curr_y+n-1) == 0 && ds_grid_get(path_grid,curr_x+i,curr_y+n) == -1)
						{
							ds_grid_set(path_grid,curr_x+i,curr_y+n-1,curr_val+1);
							var priority = heuristic(goal_x,goal_y,curr_x+i,curr_y+n-1);
							ds_priority_add(frontier,convert_point_to_str(curr_x+i,curr_y+n-1),priority);
						}
						// Check water on fall
						else if (ds_grid_get(path_grid,curr_x+i,curr_y+n) == -2)
						{
							ds_grid_set(path_grid,curr_x+i,curr_y+n,curr_val+1);
							var priority = heuristic(goal_x,goal_y,curr_x+i,curr_y+n);
							ds_priority_add(frontier,convert_point_to_str(curr_x+i,curr_y+n),priority);
						}
					}
					
					#region Water movements
					
					// Check enter water diagonal right/left
					if (ds_grid_get(path_grid,curr_x+i,curr_y) == 0 &&		// 1st right/left cell empty
						ds_grid_get(path_grid,curr_x+i,curr_y+1) == -2)		// 1st diagonal right/left cell water
					{
						ds_grid_set(path_grid,curr_x+i,curr_y+1,curr_val+1);
						var priority = heuristic(goal_x,goal_y,curr_x+i,curr_y+1);
						ds_priority_add(frontier,convert_point_to_str(curr_x+i,curr_y+1),priority);
					}
					// Check swim right/left
					if (ds_grid_get(path_grid,curr_x+i,curr_y) == -2)	// 1st right/left cell water
					{
						ds_grid_set(path_grid,curr_x+i,curr_y,curr_val+1);
						var priority = heuristic(goal_x,goal_y,curr_x+i,curr_y);
						ds_priority_add(frontier,convert_point_to_str(curr_x+i,curr_y),priority);
					}
					// Check swim up/down
					if (ds_grid_get(path_grid,curr_x,curr_y+i) == -2)	// 1st up/down cell water
					{
						ds_grid_set(path_grid,curr_x,curr_y+i,curr_val+1);
						var priority = heuristic(goal_x,goal_y,curr_x,curr_y+i);
						ds_priority_add(frontier,convert_point_to_str(curr_x,curr_y+i),priority);
					}
					
					#endregion
				}
			}
		}
	}
	
	// Destroy priority queue
	ds_priority_destroy(frontier);
}


/// @function					human_build_path(path_grid,xgoal,ygoal);
/// @param	{index}	path_grid	Pathfinding grid
/// @param	{real}  xgoal		The ending x
/// @param	{real}  ygoal		The ending y
/// @description				Builds a traversable path from path_grid, which can be followed by an object.

function human_build_path(path_grid,xgoal,ygoal)
{
	var x_previous;
	
	// Create empty path
	curr_path = path_add();
	
	// Add first point (goal point) to path
	var _x = xgoal*oGrid.cell_width+(oGrid.cell_width/2), _y = ygoal*oGrid.cell_height+(oGrid.cell_height/2);
	path_add_point(curr_path,_x,_y,100);
	var last_value = ds_grid_get(path_grid,xgoal,ygoal);
	
	for (var i=last_value-1; i>1; i--)
	{
		x_previous = xgoal;
		
		// Check right/left + one block jump right/left + swim right/left + exit right/left + swim up
		if (ds_grid_value_exists(path_grid,xgoal-1,ygoal,xgoal+1,ygoal+1,i))
		{
			xgoal = ds_grid_value_x(path_grid,x_previous-1,ygoal,x_previous+1,ygoal+1,i);
			ygoal = ds_grid_value_y(path_grid,x_previous-1,ygoal,x_previous+1,ygoal+1,i);
			_x = xgoal*oGrid.cell_width+(oGrid.cell_width/2);
			_y = ygoal*oGrid.cell_height+(oGrid.cell_height/2);
			path_add_point(curr_path,_x,_y,100);
		}
		else
		{
			// Check one block large jump up right/left + void jump right/left
			if (ds_grid_value_exists(path_grid,xgoal-2,ygoal,xgoal+2,ygoal+1,i))
			{
				xgoal = ds_grid_value_x(path_grid,x_previous-2,ygoal,x_previous+2,ygoal+1,i);
				_x = xgoal*oGrid.cell_width+(oGrid.cell_width/2);
				
				// Check if can jump
				if (ds_grid_get(path_grid,x_previous+sign(xgoal-x_previous),ygoal) == 0)
				{
					ygoal = ds_grid_value_y(path_grid,x_previous-2,ygoal,x_previous+2,ygoal+1,i);
					_y = ygoal*oGrid.cell_height+(oGrid.cell_height/2);
					path_add_point(curr_path,_x,_y,100);
				}
				else
				{
					#region Check fall right/left
					
					var n = 0;
					while (true)
					{
						n++;
						if (ds_grid_get(path_grid,x_previous-1,ygoal-n) == i ||
							ds_grid_get(path_grid,x_previous+1,ygoal-n) == i ||
							(ygoal-n) < 0)
						{
							break;
						}
					}
				
					// Check floor on fall
					if (ds_grid_value_exists(path_grid,x_previous-1,ygoal-n,x_previous+1,ygoal-n,i))
					{
						xgoal = ds_grid_value_x(path_grid,x_previous-1,ygoal-n,x_previous+1,ygoal,i);
						ygoal = ds_grid_value_y(path_grid,x_previous-1,ygoal-n,x_previous+1,ygoal,i);
						_x = xgoal*oGrid.cell_width+(oGrid.cell_width/2);
						_y = ygoal*oGrid.cell_height+(oGrid.cell_height/2);
						path_add_point(curr_path,_x,_y,100);
					}
					
					#endregion
				}
			}
			else
			{
				#region Check fall right/left
				
				var n = 0;
				while (true)
				{
					n++;
					if (ds_grid_get(path_grid,x_previous-1,ygoal-n) == i ||
						ds_grid_get(path_grid,x_previous+1,ygoal-n) == i ||
						(ygoal-n) < 0)
					{
						break;
					}
				}
				
				// Check floor on fall
				if (ds_grid_value_exists(path_grid,x_previous-1,ygoal-n,x_previous+1,ygoal-n,i))
				{
					xgoal = ds_grid_value_x(path_grid,x_previous-1,ygoal-n,x_previous+1,ygoal,i);
					ygoal = ds_grid_value_y(path_grid,x_previous-1,ygoal-n,x_previous+1,ygoal,i);
					_x = xgoal*oGrid.cell_width+(oGrid.cell_width/2);
					_y = ygoal*oGrid.cell_height+(oGrid.cell_height/2);
					path_add_point(curr_path,_x,_y,100);
				}
				else
				{
					// Check swim down
					if (ds_grid_value_exists(path_grid,xgoal,ygoal,xgoal,ygoal-1,i))
					{
						xgoal = ds_grid_value_x(path_grid,x_previous,ygoal,x_previous,ygoal-1,i);
						ygoal = ds_grid_value_y(path_grid,x_previous,ygoal,x_previous,ygoal-1,i);
						_x = xgoal*oGrid.cell_width+(oGrid.cell_width/2);
						_y = ygoal*oGrid.cell_height+(oGrid.cell_height/2);
						path_add_point(curr_path,_x,_y,100);
					}
				}
				
				#endregion
			}
		}
	}
	
	// Add last point (start point) to path
	path_add_point(curr_path,floor(x/oGrid.cell_width)*oGrid.cell_width+(oGrid.cell_width/2),floor(y/oGrid.cell_height)*oGrid.cell_height+(oGrid.cell_height/2),100);
	
	// Close and reverse path
	path_set_closed(curr_path,false);
	path_reverse(curr_path);
	
	// Print path
	show_debug_message("");
	show_debug_message("PATH:");
	for (var j=0; j<path_get_number(curr_path); j++)
	{
		show_debug_message(string(j)+":"+string(path_get_point_x(curr_path,j))+","+string(path_get_point_y(curr_path,j)));
	}
}


/// @function						human_follow_path();
/// @description					Moves the object to follow the correct path built by build_path.

function human_follow_path()
{
	// Get point count and path direction
	var point_count = path_get_number(curr_path);
	var path_dir_x = sign(path_get_point_x(curr_path,curr_path_point+1)-path_get_point_x(curr_path,curr_path_point));
	
	// If no actions have occurred
	if (curr_action == 0)
	{
		switch (curr_physical_state)
		{
			case PhysicalState.UNDERWATER:
				#region Underwater actions
				
				// Check if exit water
				if (path_get_point_y(curr_path,curr_path_point)-oGrid.cell_height == path_get_point_y(curr_path,curr_path_point+1) &&
					path_get_point_x(curr_path,curr_path_point)+oGrid.cell_width*path_dir_x == path_get_point_x(curr_path,curr_path_point+1))
				{
					horizontal_speed = swim_speed * path_dir_x;
					vertical_speed = -swim_speed;
					curr_action = 1;
					curr_jump_action = 1;
				}
				else
				{
					// Change horizontal/vertical speeds based on next point location
					horizontal_speed = swim_speed * sign(path_get_point_x(curr_path,curr_path_point+1)-x);
					vertical_speed = swim_speed * sign(path_get_point_y(curr_path,curr_path_point+1)-y);
					curr_action = 1;
				}
				break;
				
				#endregion
			
			default:
				#region Land actions
				
				// Check if next action is walk right/left
				if (path_get_point_y(curr_path,curr_path_point) == path_get_point_y(curr_path,curr_path_point+1) &&
					path_get_point_x(curr_path,curr_path_point)+oGrid.cell_width*path_dir_x == path_get_point_x(curr_path,curr_path_point+1))
				{
					horizontal_speed = walk_speed * path_dir_x;
					curr_action = 1;
				}
				// Check if next action is one block jump right/left
				else if (path_get_point_y(curr_path,curr_path_point)-oGrid.cell_height == path_get_point_y(curr_path,curr_path_point+1) &&
						 path_get_point_x(curr_path,curr_path_point)+oGrid.cell_width*path_dir_x == path_get_point_x(curr_path,curr_path_point+1))
				{
					if (curr_jump_action == 0 && curr_physical_state == PhysicalState.GROUNDED)
					{
						horizontal_speed = walk_speed * path_dir_x;
						vertical_speed = -jump_speed;
						curr_action = 1;
						curr_jump_action = 1;
					}
				}
				// Check if next point is one block large jump up right/left
				else if (path_get_point_y(curr_path,curr_path_point)-oGrid.cell_height == path_get_point_y(curr_path,curr_path_point+1) &&
						 path_get_point_x(curr_path,curr_path_point)+2*oGrid.cell_width*path_dir_x == path_get_point_x(curr_path,curr_path_point+1))
				{
					horizontal_speed = walk_speed * path_dir_x;
					vertical_speed = -jump_speed;
					curr_action = 1;
					curr_jump_action = 1;
				}
				// Check if next action is void jump right/left
				else if (path_get_point_y(curr_path,curr_path_point) == path_get_point_y(curr_path,curr_path_point+1) &&
						 path_get_point_x(curr_path,curr_path_point)+2*oGrid.cell_width*path_dir_x == path_get_point_x(curr_path,curr_path_point+1))
				{
					if (curr_jump_action == 0 && curr_physical_state == PhysicalState.GROUNDED)
					{
						horizontal_speed = walk_speed * path_dir_x;
						vertical_speed = -jump_speed;
						curr_action = 1;
						curr_jump_action = 1;
					}
				}
				// Check if next action is fall right/left + enter water right/left
				else if (path_get_point_y(curr_path,curr_path_point) < path_get_point_y(curr_path,curr_path_point+1))
				{
					horizontal_speed = walk_speed * path_dir_x;
					curr_action = 1;
				}
				
				#endregion
		}
	}
	else
	{
		if (curr_physical_state == PhysicalState.UNDERWATER)
		{
			// If current point's x is lined up with current x
			if (abs(x-path_get_point_x(curr_path,curr_path_point+1)) < 2)
			{
				horizontal_speed = 0;
			}
			else
			{
				horizontal_speed = swim_speed * sign(path_get_point_x(curr_path,curr_path_point+1)-x);
			}
			
			// If current point's y is lined up with current y
			if (abs(y-path_get_point_y(curr_path,curr_path_point+1)) < 2)
			{
				vertical_speed = 0;
			}
			else
			{
				vertical_speed = swim_speed * sign(path_get_point_y(curr_path,curr_path_point+1)-y);
			}
		}
		else
		{
			// If current point's x is lined up with current x
			if (abs(x-path_get_point_x(curr_path,curr_path_point+1)) < 4)
			{
				horizontal_speed = 0;
			}
			else
			{
				horizontal_speed = walk_speed * path_dir_x;
			}
		}
	}
	
	// Check if reached next point
	if (distance_to_point(path_get_point_x(curr_path,curr_path_point+1),path_get_point_y(curr_path,curr_path_point+1)) < 4)
	{
		if (curr_physical_state == PhysicalState.GROUNDED ||
		   (curr_physical_state == PhysicalState.UNDERWATER &&
		    point_distance(x,y,path_get_point_x(curr_path,curr_path_point+1),path_get_point_y(curr_path,curr_path_point+1)) < 4))
		{
			// Advance to next point
			curr_path_point += 1;
			curr_action = 0;
			curr_jump_action = 0;
		
			// If last point
			if (curr_path_point == point_count-1)
			{
				horizontal_speed = 0;
				vertical_speed = 0;
				curr_path_point = 0;
				path_delete(curr_path);
			}
		}
	}
}