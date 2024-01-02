/// @func	generate_world1();
/// @desc	Generates a stored world
function generate_world1()
{
	// Update world name
	worldname = "Basec";
	
	// Delete file
	// file_delete("world1a.world");
	
	// File ID
	var _fileid = file_text_open_read("world1a.world");
	
	// Check if file exist/open it
	if (_fileid != -1)
	{
		// Clear world
		clear_world();
		
		// Read file
		for (var _gy = 0; _gy < last_gy; _gy++)
		{
			// Get string
			var _str = file_text_read_string(_fileid);
			var _len = string_length(_str);
			var _idx = 1;
			
			for (var _gx = 0; _gx < last_gx; _gx++)
			{
				// Check if index is out of bounds
				if (_idx > _len)
				{
					// Go to next line
					break;
				}
				else
				{
					// Get value
					var _val = clamp(real(string_char_at(_str,_idx)),Tile.SNOW,Tile.DEEP_SEA);
				}
		
				// Set tile
				tilemap_set_at_pixel(worldtiles,_val,_gx*TILE_SIZE,_gy*TILE_SIZE);
				
				// Increment index (skip comma)
				_idx += 2;
			}
			
			// Go to new line
			file_text_readln(_fileid);
		}
	}
	else
	{
		// Open file for writing
		_fileid = file_text_open_write("world1a.world");
		
		// Loop through world
		for (var _gy = 0; _gy < last_gy; _gy++)
		{
			for (var _gx = 0; _gx < last_gx; _gx++)
			{
				// Get value
				var _val = tilemap_get_at_pixel(worldtiles,_gx*TILE_SIZE,_gy*TILE_SIZE);
		
				// Write an array to file
				file_text_write_string(_fileid,string(_val)+",");
			}
			
			// Go to new line
			file_text_writeln(_fileid);
		}
	}
	
	// Close file
	file_text_close(_fileid);
}