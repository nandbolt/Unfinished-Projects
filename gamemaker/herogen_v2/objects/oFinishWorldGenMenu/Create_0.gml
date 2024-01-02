/// @desc Event

// Inherit the parent event
event_inherited();

// Show Tilemaps
layer_set_visible(biome_tiles,true);
layer_set_visible(precipitation_tiles,true);
layer_set_visible(temp_tiles,true);

// Name
label_maptype.name = "Create";

// Generate height map button
cx = sx;
cy += yincr;
button_generate = new Button("Create World",cx,cy);
button_generate.on_click = function()
{
	// Create data transfer object
	var _data_inst = instance_create_layer(0,0,"Instances",oWorldGenToWorld);
	
	// Transfer data to object
	with (oWorldGen)
	{
		for (var _gy = 0; _gy < map_size_y; _gy++)
		{
			for (var _gx = 0; _gx < map_size_x; _gx++)
			{
				// X/Y
				var _x = (_gx * map_cell_size) + rm_center_x + map_cell_size, _y = (_gy * map_cell_size) + (map_cell_size * 2);
				
				// Get tile
				var _tile = tilemap_get_at_pixel(biome_tiles,_x,_y);
				
				// Store tile
				with (_data_inst)
				{
					world_data[_gx][_gy] = _tile;
				}
			}
		}
	}
	
	// Go to civilization generator/world
	room_goto(rWorld);
}