/// @func	generate_world4();
/// @desc	Generates world by choosing a starting point and building a continent around it
function generate_world4()
{	
	// Determine how many continents
	var _continents = irandom_range(1,5);
	//var _continents = 1;
	
	// Update world name
	worldname = "Conto "+string(_continents);
	
	// Loop per continent
	for (var _i = 0; _i < _continents; _i++)
	{
		// Generate starting point
		var _queue = ds_queue_create();
		var _size = irandom_range(250,1000);
		var _cnt = 1;
		var _tile = Tile.SNOW;
		var _thresh = 1*round(_size/250);
		var _spd = 1*round(_size/250);
		var _sgx = irandom(last_gx), _sgy = irandom(last_gy);
		tilemap_set_at_pixel(worldtiles,Tile.SNOW,_sgx*TILE_SIZE,_sgy*TILE_SIZE);
	
		// Add neighbors
		ds_queue_enqueue(_queue,
			_sgx+1,_sgy,	// Right
			_sgx,_sgy+1,	// Bottom
			_sgx-1,_sgy,	// Left
			_sgx,_sgy-1)	// Top
	
		// Spiral around starting point
		while (_cnt < _size)
		{
			// Check if empty queue
			if (ds_queue_empty(_queue))
			{
				break;
			}
		
			// Check next value in queue
			var _cgx = ds_queue_dequeue(_queue);
			var _cgy = ds_queue_dequeue(_queue);
			var _x = _cgx * TILE_SIZE, _y = _cgy * TILE_SIZE;
		
			// Check if setting a new tile
			var _ctile = tilemap_get_at_pixel(worldtiles,_x,_y);
			if (_ctile == Tile.EMPTY || _ctile > _tile)
			{
				// Check chance
				if (irandom(99) < 19)
				{
					// Check distance from starting point
					var _manhattan = abs(_cgx-_sgx)+abs(_cgy-_sgy);
					if (_tile < Tile.SEA && _manhattan > _thresh && irandom(99) < 9)
					{
						// Go to next tile
						_tile++;
						_thresh += _spd;
					}
				
					// Set tile
					tilemap_set_at_pixel(worldtiles,_tile,_x,_y);
		
					// Check right neighbor
					if (tilemap_get_at_pixel(worldtiles,_cgx+1,_cgy) == Tile.EMPTY)
					{
						// Add neighbors
						ds_queue_enqueue(_queue,_cgx+1,_cgy);
					}
					// Check bottom neighbor
					if (tilemap_get_at_pixel(worldtiles,_cgx,_cgy+1) == Tile.EMPTY)
					{
						// Add neighbors
						ds_queue_enqueue(_queue,_cgx,_cgy+1);
					}
					// Check left neighbor
					if (tilemap_get_at_pixel(worldtiles,_cgx-1,_cgy) == Tile.EMPTY)
					{
						// Add neighbors
						ds_queue_enqueue(_queue,_cgx-1,_cgy);
					}
					// Check top neighbor
					if (tilemap_get_at_pixel(worldtiles,_cgx,_cgy-1) == Tile.EMPTY)
					{
						// Add neighbors
						ds_queue_enqueue(_queue,_cgx,_cgy-1);
					}
			
					// Increment count
					_cnt++;
				}
				else
				{
					// Put it back in queue
					ds_queue_enqueue(_queue,_cgx,_cgy);
				}
			}
		}
	
		// Destroy queue
		ds_queue_destroy(_queue);
	}
	
	// Fill rest with deep sea
	for (var _gy = last_gy; _gy >= 0; _gy--)
	{
		for (var _gx = last_gx; _gx >= 0; _gx--)
		{
			var _x = _gx * TILE_SIZE, _y = _gy * TILE_SIZE;
			if (tilemap_get_at_pixel(worldtiles,_x,_y) == Tile.EMPTY)
			{
				tilemap_set_at_pixel(worldtiles,Tile.DEEP_SEA,_x,_y);
			}
		}
	}
}