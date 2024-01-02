/// @func	generate_biome_general({int} sealevel,{int} grasslevel,{int} snowlevel);
/// @desc	Generates general biomes.
function generate_biome_general(_sealevel,_grasslevel,_snowlevel)
{
	for (var _gy = 0; _gy < map_size_y; _gy++)
	{
		for (var _gx = 0; _gx < map_size_x; _gx++)
		{
			// X/Y
			var _x = (_gx * map_cell_size) + rm_center_x + map_cell_size, _y = (_gy * map_cell_size) + (map_cell_size * 2);
			
			// Get height tile
			var _height = tilemap_get_at_pixel(height_tiles,_x,_y);
			
			// Tile
			var _tile = irandom_range(1,5);
			
			// Choose correct tile
			if (_height <= _sealevel)
			{
				_tile = 1;
			}
			else if (_height < _grasslevel)
			{
				_tile = 2;
			}
			else if (_height < _grasslevel+1)
			{
				_tile = 3;
			}
			else if (_height < _snowlevel)
			{
				_tile = 4;
			}
			else
			{
				_tile = 5;
			}
			
			// Set tile
			tilemap_set_at_pixel(biome_tiles,_tile,_x,_y);
		}
	}
}