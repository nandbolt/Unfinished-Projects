/*
Terrain Type:
DIAGONAL DRIFT
*/

/// @func	generate_height_drift({int} low_height,{int} max_height,{int} root_height,{bool} root_row,{bool} root_column);
/// @desc	Generates height map 3.
function generate_height_drift(_low_height,_max_height,_root_height=0,_root_row=false,_root_column=false)
{
	var _root = _root_height;
	for (var _gy = 0; _gy < map_size_y; _gy++)
	{
		for (var _gx = 0; _gx < map_size_x; _gx++)
		{
			// Nearby tiles
			var _left_tile = 0;
			var _top_tile = 0;
			var _height = 0;
			
			// X/Y
			var _x = (_gx * map_cell_size) + rm_center_x + map_cell_size, _y = (_gy * map_cell_size) + (map_cell_size * 2);
			
			// Check nearby tiles
			_left_tile = tilemap_get_at_pixel(height_tiles,_x-map_cell_size,_y);
			_top_tile = tilemap_get_at_pixel(height_tiles,_x,_y-map_cell_size);
			
			// First tile
			if (_left_tile == 0 && _top_tile == 0)
			{
				if (_root == 0)
				{
					_height = irandom_range(_low_height,_max_height);
					_root = _height;
				}
				else _height = _root;
			}
			// Top row tiles
			else if (_top_tile == 0)
			{
				if (!_root_row) _height = irandom_range(_left_tile-1,_left_tile+1);
				else _height = _root;
			}
			// Left column tiles
			else if (_left_tile == 0)
			{
				if (!_root_column) _height = irandom_range(_top_tile-1,_top_tile+1);
				else _height = _root;
			}
			// Everything else
			else
			{
				// Subtract two tiles
				var _dif = abs(_top_tile - _left_tile);
				
				// Near two different tiles by 2
				if (_dif == 2)
				{
					// Check smaller value
					if (_top_tile < _left_tile)
					{
						_height = _top_tile+1;
					}
					else
					{
						_height = _left_tile+1;
					}
				}
				// Near two different tiles by 1
				else if (_dif == 1)
				{
					// Check smaller value
					if (_top_tile < _left_tile)
					{
						_height = irandom_range(_top_tile,_left_tile);
					}
					else
					{
						_height = irandom_range(_left_tile,_top_tile);
					}
				}
				// Near two similar tiles
				else
				{
					// Choose out of tile range
					_height = irandom_range(_top_tile-1,_top_tile+1);
				}
			}
			
			// Clamp height
			_height = clamp(_height,_low_height,_max_height);
			
			// Set tile
			tilemap_set_at_pixel(height_tiles,_height,_x,_y);
		}
	}
}