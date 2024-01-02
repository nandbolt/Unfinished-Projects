/// @func	clear_map({int} tileset);
/// @desc	Clears given map
function clear_map(_tileset)
{
	for (var _gy = 0; _gy < map_size_y; _gy++)
	{
		for (var _gx = 0; _gx < map_size_x; _gx++)
		{
			var _x = (_gx * map_cell_size) + rm_center_x + map_cell_size, _y = (_gy * map_cell_size) + (map_cell_size * 2);
			tilemap_set_at_pixel(_tileset,0,_x,_y);
		}
	}
}