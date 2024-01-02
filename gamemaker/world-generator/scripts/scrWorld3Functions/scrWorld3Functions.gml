/// @func	generate_world3();
/// @desc	Generates world by checking adjacent tiles and making sure things flow smoothly
function generate_world3()
{
	// Update world name
	worldname = "Lado";
	var _oo = irandom(7);
	repeat (_oo)
	{
		worldname += "o";
	}
	
	for (var _gy = last_gy; _gy >= 0; _gy--)
	{
		for (var _gx = last_gx; _gx >= 0; _gx--)
		{
			// Nearby tiles
			var _rtile = Tile.EMPTY;
			var _btile = Tile.EMPTY;
			var _tile = Tile.EMPTY;
			
			// X/Y
			var _x = _gx * TILE_SIZE, _y = _gy * TILE_SIZE;
			
			// Check right tile
			_rtile = tilemap_get_at_pixel(worldtiles,_x+TILE_SIZE,_y);
			_btile = tilemap_get_at_pixel(worldtiles,_x,_y+TILE_SIZE);
			
			// First tile
			if (_rtile == -1 && _btile == -1)
			{
				_tile = irandom_range(Tile.SNOW,Tile.DEEP_SEA);
			}
			// Bottom row tiles
			else if (_btile == -1)
			{
				_tile = clamp(irandom_range(_rtile-1,_rtile+1),Tile.SNOW,Tile.DEEP_SEA);
			}
			// Right column tiles
			else if (_rtile == -1)
			{
				_tile = clamp(irandom_range(_btile-1,_btile+1),Tile.SNOW,Tile.DEEP_SEA);
			}
			// Everything else
			else
			{
				// Subtract two tiles
				var _dif = abs(_btile - _rtile);
				
				// Near two different tiles by 2
				if (_dif == 2)
				{
					// Check smaller value
					if (_btile < _rtile)
					{
						_tile = _btile+1;
					}
					else
					{
						_tile = _rtile+1;
					}
				}
				// Near two different tiles by 1
				else if (_dif == 1)
				{
					// Check smaller value
					if (_btile < _rtile)
					{
						_tile = irandom_range(_btile,_rtile);
					}
					else
					{
						_tile = irandom_range(_rtile,_btile);
					}
				}
				// Near two similar tiles
				else
				{
					// Choose out of tile range
					_tile = clamp(irandom_range(_btile-1,_btile+1),Tile.SNOW,Tile.DEEP_SEA);
				}
			}
			
			// Set tile
			tilemap_set_at_pixel(worldtiles,_tile,_x,_y);
		}
	}
}