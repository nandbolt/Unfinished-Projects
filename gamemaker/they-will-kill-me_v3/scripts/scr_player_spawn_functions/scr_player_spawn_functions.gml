/// @func	spawn_zombie(_x,_y);
/// @desc	Spawns a zombie at a specified location
function spawn_zombie(_x,_y)
{
	if (curr_currency >= zombie_cost)
	{
		// Convert mouse coordinates to tile coordinates
		var _spawn_tile_x = floor(_x/obj_grid.cell_width);
		var _spawn_tile_y = floor(_y/obj_grid.cell_height);
		
		// Check if tile is a spawn area
		for (var i=_spawn_tile_y; i<ds_grid_height(global.spawning_grid); i++)
		{
			if (ds_grid_get(global.spawning_grid,_spawn_tile_x,i) == 1)
			{
				// Convert tile back to world coordinates
				var _spawn_x = _spawn_tile_x*obj_grid.cell_width+(obj_grid.cell_width/2);
				var _spawn_y = i*obj_grid.cell_height+(2*obj_grid.cell_height/2)-obj_grid.cell_height;
		
				// Spawn instance
				var instance = instance_create_layer(_spawn_x,_spawn_y,"Instances",obj_zombie);
		
				// Deduct cost
				curr_currency -= zombie_cost;
				
				// Break loop
				break;
			}
		}
	}
}