/*
Terrain Type:
CONTINENTAL
*/

/// @func	generate_height_island({int} low_height,{int} max_height,{int} min_islands,{int} max_islands,{int} min_size,{int} max_size);
/// @desc	Generates height map 4.
function generate_height_island(_low_height,_max_height,_min_islands,_max_islands,_min_size,_max_size)
{
	// Determine island count
	var _islands = irandom_range(_min_islands,_max_islands);
	
	// Loop per continent
	for (var _i = 0; _i < _islands; _i++)
	{
		// Generate starting point
		var _queue = ds_queue_create();
		var _size = irandom_range(_min_size,_max_size);
		var _cnt = 1;
		var _tile = clamp(irandom_range(_low_height+1,_max_height),_low_height,_max_height);
		var _thresh = round(_size/200);
		var _spd = _thresh;
		var _sgx = irandom(map_size_x-1), _sgy = irandom(map_size_y-1);
		var _x = (_sgx * map_cell_size) + rm_center_x + map_cell_size, _y = (_sgy * map_cell_size) + (map_cell_size * 2);
		tilemap_set_at_pixel(height_tiles,_tile,_x,_y);
		
		// Right neighbor
		if (h4_can_add_neighbor(_sgx,_sgy,1,0))
		{
			ds_queue_enqueue(_queue,_sgx+1,_sgy);
		}
		// Top neighbor
		if (h4_can_add_neighbor(_sgx,_sgy,0,-1))
		{
			ds_queue_enqueue(_queue,_sgx,_sgy-1);
		}
		// Left neighbor
		if (h4_can_add_neighbor(_sgx,_sgy,-1,0))
		{
			ds_queue_enqueue(_queue,_sgx-1,_sgy);
		}
		// Bottom neighbor
		if (h4_can_add_neighbor(_sgx,_sgy,0,1))
		{
			ds_queue_enqueue(_queue,_sgx,_sgy+1);
		}
		
		// Spiral around starting point
		while (_cnt < _size)
		{
			// Check empty queue
			if (ds_queue_empty(_queue))
			{
				break;
			}
			
			// Check next value in queue
			var _gx = ds_queue_dequeue(_queue), _gy = ds_queue_dequeue(_queue);
			_x = (_gx * map_cell_size) + rm_center_x + map_cell_size;
			_y = (_gy * map_cell_size) + (map_cell_size * 2);
			
			// Check if setting new tile
			var _curr_tile = tilemap_get_at_pixel(height_tiles,_x,_y);
			if (_curr_tile == 0 || _curr_tile < _tile)
			{
				// Check chance
				if (irandom(99) < 19)
				{
					// Check distance from starting point
					var _dist = get_manhattan_distance(_gx,_gy,_sgx,_sgy);
					if (_tile > _low_height && _dist > _thresh && irandom(99) < 9)
					{
						// Go to next tile
						_tile--;
						_thresh += _spd;
					}
					
					// Set tile
					tilemap_set_at_pixel(height_tiles,_tile,_x,_y);
					
					// Right neighbor
					if (h4_can_add_neighbor(_gx,_gy,1,0))
					{
						ds_queue_enqueue(_queue,_gx+1,_gy);
					}
					// Top neighbor
					if (h4_can_add_neighbor(_gx,_gy,0,-1))
					{
						ds_queue_enqueue(_queue,_gx,_gy-1);
					}
					// Left neighbor
					if (h4_can_add_neighbor(_gx,_gy,-1,0))
					{
						ds_queue_enqueue(_queue,_gx-1,_gy);
					}
					// Bottom neighbor
					if (h4_can_add_neighbor(_gx,_gy,0,1))
					{
						ds_queue_enqueue(_queue,_gx,_gy+1);
					}
					
					// Increment count
					_cnt++;
				}
				else
				{
					// Put back in queue
					ds_queue_enqueue(_queue,_gx,_gy);
				}
			}
		}
		
		// Destroy queue
		ds_queue_destroy(_queue);
		
	}
	
	// Fill rest with lowest height
	for (var _gy = 0; _gy < map_size_y; _gy++)
	{
		for (var _gx = 0; _gx < map_size_x; _gx++)
		{
			// Check if unfilled
			var _x = (_gx * map_cell_size) + rm_center_x + map_cell_size, _y = (_gy * map_cell_size) + (map_cell_size * 2);
			var _tile = tilemap_get_at_pixel(height_tiles,_x,_y);
			if (_tile == 0)
			{
				tilemap_set_at_pixel(height_tiles,_low_height,_x,_y);
			}
		}
	}
}

function h4_can_add_neighbor(_gx,_gy,_gxoff,_gyoff)
{
	var _ngx = _gx+_gxoff, _ngy = _gy+_gyoff;
	var _nx = (_ngx * map_cell_size) + rm_center_x + map_cell_size, _ny = (_ngy * map_cell_size) + (map_cell_size * 2);
	var _x = (_gx * map_cell_size) + rm_center_x + map_cell_size, _y = (_gy * map_cell_size) + (map_cell_size * 2);
	if (_ngx >= 0 && _ngx < map_size_x &&
		_ngy >= 0 && _ngy < map_size_y &&
		tilemap_get_at_pixel(height_tiles,_nx,_ny) < tilemap_get_at_pixel(height_tiles,_x,_y))
	{
		return true;
	}
	return false;
}