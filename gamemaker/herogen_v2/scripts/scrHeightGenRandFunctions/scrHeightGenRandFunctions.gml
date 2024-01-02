/*
Terrain Type:
SUPERFLAT
*/

/// @func	generate_height_rand({int} low_height,{int} max_height,{int} divs);
/// @desc	Generates height map 1.
function generate_height_rand(_low_height,_max_height,_divs)
{
	_divs++;
	for (var _yi = 0; _yi < _divs; _yi++)
	{
		for (var _xi = 0; _xi < _divs; _xi++)
		{
			// Calculate bounds
			var _sgx = _xi * (map_size_x / _divs), _sgy = _yi * (map_size_y / _divs);
			var _egx = _sgx + (map_size_x / _divs), _egy = _sgy + (map_size_y / _divs);
		
			var _height = irandom_range(_low_height,_max_height);
			for (var _gy = _sgy; _gy < _egy; _gy++)
			{
				for (var _gx = _sgx; _gx < _egx; _gx++)
				{
					var _x = (_gx * map_cell_size) + rm_center_x + map_cell_size, _y = (_gy * map_cell_size) + (map_cell_size * 2);
					tilemap_set_at_pixel(height_tiles,_height,_x,_y);
				}
			}
		}
	}
}