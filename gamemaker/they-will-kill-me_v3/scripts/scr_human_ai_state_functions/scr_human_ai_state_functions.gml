/// @func	human_ai_state_wander();
/// @desc	Human AI's wandering state.
function human_ai_state_wander()
{
	// Check if switching to state
	if (state_new)
	{
		goal_exists = false;
	}
	
	// Choose random goal location if none exists.
	while (!goal_exists)
	{
		// Choose random tile and convert coordinates to tile coordinates
		var _goal_tile_x = floor(random(room_width)/obj_grid.cell_width);
		var _goal_tile_y = floor(random(room_height)/obj_grid.cell_height);
		
		// Check if tile is a spawn area
		for (var i=_goal_tile_y; i<ds_grid_height(global.spawning_grid); i++)
		{
			if (ds_grid_get(global.spawning_grid,_goal_tile_x,i) == 1)
			{
				// Convert tile back to world coordinates
				goal_x = _goal_tile_x*obj_grid.cell_width+(obj_grid.cell_width/2);
				goal_y = i*obj_grid.cell_height+(2*obj_grid.cell_height/2)-obj_grid.cell_height;
				
				// Break loop
				goal_exists = true;
				my_body.query_path = true;
				break;
			}
		}
	}
	
	// Check if not healthy
	if ((my_body.curr_hunger/my_body.max_hunger) < 0.5 || (my_body.curr_thirst/my_body.max_thirst) < 0.5)
	{
		state_switch("Rush");
	}
}


/// @func	human_ai_state_rush();
/// @desc	Human AI's rushing state.
function human_ai_state_rush()
{
	// Check if switching to state
	if (state_new)
	{
		goal_exists = false;
	}
	
	// Choose specific goal location if none exists.
	while (!goal_exists)
	{
		// Declare variables
		var _goal_instance, _goal_tile_x, _goal_tile_y;
		
		// Check if thirsty
		if ((my_body.curr_thirst/my_body.max_thirst) < 0.5)
		{
			_goal_instance = instance_nearest(my_body.x,my_body.y,obj_geyser);
			
		}
		// Check if hungry
		else
		{
			_goal_instance = instance_nearest(my_body.x,my_body.y,obj_bush);
		}
		_goal_tile_x = floor(_goal_instance.x/obj_grid.cell_width);
		_goal_tile_y = floor(_goal_instance.y/obj_grid.cell_height);
		
		// Check if tile is a spawn area
		for (var i=_goal_tile_y; i<ds_grid_height(global.spawning_grid); i++)
		{
			if (ds_grid_get(global.spawning_grid,_goal_tile_x,i) == 1)
			{
				// Convert tile back to world coordinates
				goal_x = _goal_tile_x*obj_grid.cell_width+(obj_grid.cell_width/2);
				goal_y = i*obj_grid.cell_height+(2*obj_grid.cell_height/2)-obj_grid.cell_height;
				
				// Break loop
				goal_exists = true;
				my_body.query_path = true;
				break;
			}
		}
	}
	
	// Check if healthy
	if ((my_body.curr_hunger/my_body.max_hunger) > 0.5 && (my_body.curr_thirst/my_body.max_thirst) > 0.5)
	{
		state_switch("Wander");
	}
}


/// @func	human_ai_state_combat();
/// @desc	Human AI's combat state.
function human_ai_state_combat()
{
	show_debug_message("Hello.");
}