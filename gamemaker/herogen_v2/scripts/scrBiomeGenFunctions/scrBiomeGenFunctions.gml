/*
EMPTY CHUNK ARRAY:
_environment =
[[	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	],
 [	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	],
 [	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	],
 [	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	],
 [	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	],
 [	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	],
 [	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	],
 [	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	],
 [	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	],
 [	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	],
 [	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	],
 [	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	],
 [	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	],
 [	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	],
 [	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	],
 [	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	]];
*/


/// @func	spawn_ocean_environment({int} gx,{int} gy);
function spawn_ocean_environment(_gx,_gy)
{
}


/// @func	spawn_dirt_environment({int} gx,{int} gy);
function spawn_dirt_environment(_gx,_gy)
{
}


/// @func	spawn_grass_environment({int} gx,{int} gy);
function spawn_grass_environment(_gx,_gy)
{
	// Setup chunk array
	var _environment;
	
	// Choose random chunk
	var _n = 0;
	var _m = irandom(99);
	if (_m < 5)
	{
		// House
		_n = -1;
	}
	else if (_m < 10)
	{
		// Empty
		_n = 1;
	}
	
	// Set chunk
	switch (_n)
	{
		case 0:
			#region Random Trees (90)
			var _chance = irandom_range(4,59);
			var _xs = irandom(1), _ys = irandom(1);			// Alters starting location for forest (4 options)
			for (var _j = 0; _j < TILES_PER_CHUNK; _j++)
			{
				for (var _i = 0; _i < TILES_PER_CHUNK; _i++)
				{
					var _n = irandom(99);
					if (_chance >= _n && _j % 3 == 1+_ys && _i % 3 == 1+_xs)
					{
						// Tree Wall
						_environment[_j][_i] = 2;
					}
					else
					{
						// Empty
						_environment[_j][_i] = 0;
					}
				}
			}
			#endregion
			break;
		case 1:
			#region Tree House 1 (5)
			_environment =
			[[	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	],
			 [	0,	2,	2,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	2,	0,	0	],
			 [	0,	2,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	2,	2,	2,	0	],
			 [	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	2,	0,	0	],
			 [	0,	2,	2,	2,	2,	0,	0,	2,	2,	2,	2,	2,	0,	0,	0,	0	],
			 [	0,	2,	0,	0,	2,	0,	0,	2,	0,	0,	0,	2,	0,	0,	0,	0	],
			 [	0,	2,	0,	0,	0,	0,	0,	2,	0,	0,	0,	2,	0,	0,	0,	0	],
			 [	0,	2,	0,	0,	2,	0,	0,	2,	0,	0,	0,	2,	0,	0,	0,	0	],
			 [	0,	2,	0,	0,	2,	2,	2,	2,	0,	0,	0,	2,	0,	0,	0,	0	],
			 [	0,	2,	0,	0,	0,	0,	0,	0,	0,	0,	0,	2,	0,	0,	0,	0	],
			 [	0,	2,	0,	0,	0,	0,	0,	0,	0,	0,	0,	2,	0,	0,	0,	0	],
			 [	0,	2,	0,	0,	0,	0,	0,	0,	0,	0,	0,	2,	0,	0,	0,	0	],
			 [	0,	2,	0,	0,	0,	0,	0,	0,	0,	0,	0,	2,	0,	0,	0,	0	],
			 [	0,	2,	0,	0,	0,	0,	0,	0,	0,	0,	0,	2,	0,	2,	0,	0	],
			 [	0,	2,	2,	2,	2,	2,	2,	2,	2,	2,	2,	2,	0,	0,	2,	0	],
			 [	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	]];
			#endregion
			break;
		default:
			#region Nothing (5)
			_environment =
			[[	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	],
			 [	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	],
			 [	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	],
			 [	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	],
			 [	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	],
			 [	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	],
			 [	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	],
			 [	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	],
			 [	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	],
			 [	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	],
			 [	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	],
			 [	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	],
			 [	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	],
			 [	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	],
			 [	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	],
			 [	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	]];
			 #endregion
	}
	
	// Generate chunk
	for (var _j = 0; _j < TILES_PER_CHUNK; _j++)
	{
		for (var _i = 0; _i < TILES_PER_CHUNK; _i++)
		{
			// Check rock
			if (_environment[_j][_i] == 1)
			{
				// Get X/Y
				var _x = _gx * TILE_SIZE * TILES_PER_CHUNK + _i * TILE_SIZE, _y = _gy * TILE_SIZE * TILES_PER_CHUNK + _j * TILE_SIZE;
				
				// Set tiles
				tilemap_set_at_pixel(overworld_tiles,1,_x,_y);
				tilemap_set_at_pixel(collision_tiles,CollisionTile.WALL,_x,_y);
			}
			// Check tree
			else if (_environment[_j][_i] == 2)
			{
				// Get X/Y
				var _x = _gx * TILE_SIZE * TILES_PER_CHUNK + _i * TILE_SIZE, _y = _gy * TILE_SIZE * TILES_PER_CHUNK + _j * TILE_SIZE;
				
				// Set tiles
				tilemap_set_at_pixel(overworld_tiles,2,_x,_y);
				tilemap_set_at_pixel(collision_tiles,CollisionTile.WALL,_x,_y);
				
				// Set sky tiles
				for (var _q = -1; _q < 2; _q++)
				{
					for (var _p = -1; _p < 2; _p++)
					{
						var _xoff = _p * TILE_SIZE, _yoff = _q * TILE_SIZE;
						tilemap_set_at_pixel(sky_tiles,1,_x+_xoff,_y+_yoff);
					}
				}
			}
		}
	}
}


/// @func	spawn_rock_environment({int} gx,{int} gy);
function spawn_rock_environment(_gx,_gy)
{
	// Setup chunk array
	var _environment;
	
	// Choose random chunk
	var _n = 0;
	var _m = irandom(99);
	if (_m < 5)
	{
		// House
		_n = -1;
	}
	else if (_m < 10)
	{
		// Empty
		_n = 1;
	}
	
	// Set chunk
	switch (_n)
	{
		case 0:
			#region Random Rocks (90)
			var _chance = irandom_range(4,79);
			for (var _j = 0; _j < TILES_PER_CHUNK; _j++)
			{
				for (var _i = 0; _i < TILES_PER_CHUNK; _i++)
				{
					var _n = irandom(99);
					if (_chance >= _n)
					{
						// Rock Wall
						_environment[_j][_i] = 1;
					}
					else
					{
						// Empty
						_environment[_j][_i] = 0;
					}
				}
			}
			#endregion
			break;
		case 1:
			#region Rock House 1 (5)
			_environment =
			[[	1,	1,	1,	1,	1,	1,	1,	1,	1,	1,	1,	1,	1,	1,	0,	1	],
			 [	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	1	],
			 [	1,	0,	1,	1,	1,	1,	1,	1,	1,	1,	1,	1,	1,	1,	0,	1	],
			 [	1,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	1	],
			 [	1,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	1	],
			 [	1,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	1	],
			 [	1,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	1	],
			 [	1,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	1	],
			 [	1,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	1	],
			 [	1,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	1	],
			 [	1,	0,	1,	0,	0,	0,	0,	1,	1,	1,	1,	1,	1,	1,	0,	1	],
			 [	1,	0,	1,	0,	0,	0,	0,	1,	0,	0,	0,	0,	0,	0,	0,	1	],
			 [	1,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	1	],
			 [	1,	0,	1,	1,	1,	1,	1,	1,	0,	0,	0,	0,	0,	0,	0,	1	],
			 [	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	1	],
			 [	1,	0,	1,	1,	1,	1,	1,	1,	1,	1,	1,	1,	1,	1,	0,	1	]];
			#endregion
			break;
		default:
			#region Nothing (5)
			_environment =
			[[	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	],
			 [	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	],
			 [	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	],
			 [	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	],
			 [	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	],
			 [	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	],
			 [	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	],
			 [	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	],
			 [	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	],
			 [	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	],
			 [	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	],
			 [	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	],
			 [	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	],
			 [	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	],
			 [	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	],
			 [	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	]];
			 #endregion
	}
	
	// Generate chunk
	for (var _j = 0; _j < TILES_PER_CHUNK; _j++)
	{
		for (var _i = 0; _i < TILES_PER_CHUNK; _i++)
		{
			// Check rock
			if (_environment[_j][_i] == 1)
			{
				// Get X/Y
				var _x = _gx * TILE_SIZE * TILES_PER_CHUNK + _i * TILE_SIZE, _y = _gy * TILE_SIZE * TILES_PER_CHUNK + _j * TILE_SIZE;
				
				// Set tiles
				tilemap_set_at_pixel(overworld_tiles,1,_x,_y);
				tilemap_set_at_pixel(collision_tiles,CollisionTile.WALL,_x,_y);
			}
		}
	}
}


/// @func	spawn_snow_environment({int} gx,{int} gy);
function spawn_snow_environment(_gx,_gy)
{
}