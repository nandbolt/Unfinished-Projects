/*
Terrain Type:
PERLIN NOISE
*/

/// @func	generate_height_perlin({int} low_height,{int} max_height,{int} octaves,{int} persistence,{real} resolution,{real} xoff, {real} yoff);
/// @desc	Generates height map 5.
function generate_height_perlin(_low_height,_max_height,_octaves,_persistence,_resolution=16,_xoff,_yoff)
{
	// Create perlin object
	var _perlin = instance_create_layer(0,0,"Instances",oPerlin);
	
	// Create terrain
	for (var _gy = 0; _gy < map_size_y; _gy++)
	{
		for (var _gx = 0; _gx < map_size_x; _gx++)
		{
			// Get perlin value
			var _height = 0;
			with (_perlin)
			{
				var _val = octave_perlin((_gx/_resolution)+_xoff,(_gy/_resolution)+_yoff,0,_octaves,_persistence);
				_val = clamp((_val - 0.25) / 0.75,0,1);
				show_debug_message(_val);
				_height = round(((_max_height-_low_height) * _val) + _low_height);
			}
			
			// Set tile
			var _x = (_gx * map_cell_size) + rm_center_x + map_cell_size, _y = (_gy * map_cell_size) + (map_cell_size * 2);
			tilemap_set_at_pixel(height_tiles,_height,_x,_y);
		}
	}
	
	// Destroy perlin object
	instance_destroy(_perlin);
}