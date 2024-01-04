/// @desc Start Game

#region Spawning

var _spawned = false;

#region Spawn Human

_spawned = false;

while (!_spawned)
{
	// Choose random tile and convert coordinates to tile coordinates
	var _spawn_tile_x = floor(random(room_width)/obj_grid.cell_width);
	var _spawn_tile_y = floor(random(room_height)/obj_grid.cell_height);
		
	// Check if tile is a spawn area
	for (var i=_spawn_tile_y; i<ds_grid_height(global.spawning_grid); i++)
	{
		if (ds_grid_get(global.spawning_grid,_spawn_tile_x,i) == 1)
		{
			// Convert tile back to world coordinates
			var _spawn_x = _spawn_tile_x*obj_grid.cell_width+(obj_grid.cell_width/2);
			var _spawn_y = i*obj_grid.cell_height+(2*obj_grid.cell_height/2)-obj_grid.cell_height;
		
			// Spawn instance
			var _human = instance_create_layer(_spawn_x,_spawn_y,"Instances",obj_human);
			_human.main_character = true;
			
			// Break loop
			_spawned = true;
			break;
		}
	}
}

#endregion

#region Spawn Bush

_spawned = false;

while (!_spawned)
{
	// Choose random tile and convert coordinates to tile coordinates
	var _spawn_tile_x = floor(random(room_width)/obj_grid.cell_width);
	var _spawn_tile_y = floor(random(room_height)/obj_grid.cell_height);
		
	// Check if tile is a spawn area
	for (var i=_spawn_tile_y; i<ds_grid_height(global.spawning_grid); i++)
	{
		if (ds_grid_get(global.spawning_grid,_spawn_tile_x,i) == 1)
		{
			// Convert tile back to world coordinates
			var _spawn_x = _spawn_tile_x*obj_grid.cell_width+(obj_grid.cell_width/2);
			var _spawn_y = i*obj_grid.cell_height+(obj_grid.cell_height/2);
		
			// Spawn instance
			var _bush = instance_create_layer(_spawn_x,_spawn_y,"Instances",obj_bush);
				
			// Break loop
			_spawned = true;
			break;
		}
	}
}

#endregion

#region Spawn Geyser

_spawned = false;

while (!_spawned)
{
	// Choose random tile and convert coordinates to tile coordinates
	var _spawn_tile_x = floor(random(room_width)/obj_grid.cell_width);
	var _spawn_tile_y = floor(random(room_height)/obj_grid.cell_height);
		
	// Check if tile is a spawn area
	for (var i=_spawn_tile_y; i<ds_grid_height(global.spawning_grid); i++)
	{
		if (ds_grid_get(global.spawning_grid,_spawn_tile_x,i) == 1)
		{
			// Convert tile back to world coordinates
			var _spawn_x = _spawn_tile_x*obj_grid.cell_width+(obj_grid.cell_width/2);
			var _spawn_y = i*obj_grid.cell_height+(2*obj_grid.cell_height/2)-obj_grid.cell_height;
			
			if (!place_meeting(_spawn_x,_spawn_y,obj_bush))
			{
				// Spawn instance
				var _geyser = instance_create_layer(_spawn_x,_spawn_y,"Instances",obj_geyser);
				
				// Break loop
				_spawned = true;
				break;
			}
		}
	}
}

#endregion

#endregion