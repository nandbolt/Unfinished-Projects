/// @func	generate_biome_precipitation({int} minlevel,{int} maxlevel,{int} zones);
/// @desc	Generates precipitation for biomes.
function generate_biome_precipitation(_minlevel=0,_maxlevel=3,_zones=4)
{
	var _points;
	var _point_cnt = _zones;
	
	// Make an array of points
	for (var _i = 0; _i < _point_cnt; _i++)
	{
		_points[_i] = [irandom(map_size_x)-1,irandom(map_size_y)-1,irandom_range(_minlevel,_maxlevel)];
	}
	
	// Go throught map
	for (var _gy = 0; _gy < map_size_y; _gy++)
	{
		for (var _gx = 0; _gx < map_size_x; _gx++)
		{
			var _closest_dist = 100;
			var _tile = 0;
			
			// Check distance from point
			for (var _i = 0; _i < _point_cnt; _i++)
			{
				var _px = _points[_i][0], _py = _points[_i][1];
				var _curr_dist = get_manhattan_distance(_gx,_gy,_px,_py);
				if (_curr_dist < _closest_dist)
				{
					_closest_dist = _curr_dist;
					_tile = _points[_i][2];
				}
			}
			
			// X/Y
			var _x = (_gx * map_cell_size) + rm_center_x + map_cell_size, _y = (_gy * map_cell_size) + (map_cell_size * 2);
			
			// Set tile
			tilemap_set_at_pixel(precipitation_tiles,_tile,_x,_y);
		}
	}
}