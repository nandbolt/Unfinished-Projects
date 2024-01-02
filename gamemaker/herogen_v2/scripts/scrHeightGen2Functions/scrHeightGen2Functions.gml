/*
Terrain Type:
RANDOM
*/

/// @func	generate_height2({int} low_height,{int} max_height);
/// @desc	Generates height map 2.
function generate_height2(_low_height,_max_height)
{
	for (var _gy = 0; _gy < map_size_y; _gy++)
	{
		for (var _gx = 0; _gx < map_size_x; _gx++)
		{
			var _height = irandom_range(_low_height,_max_height);
			var _x = (_gx * map_cell_size) + rm_center_x + map_cell_size, _y = (_gy * map_cell_size) + (map_cell_size * 2);
			tilemap_set_at_pixel(height_tiles,_height,_x,_y);
		}
	}
}