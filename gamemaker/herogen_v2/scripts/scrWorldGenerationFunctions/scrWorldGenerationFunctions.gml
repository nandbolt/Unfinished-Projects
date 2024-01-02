/// @func	spawn_nearby_chunks({int} gx,{int} gy);
/// @desc	Spawns chunks close enough to given position.
function spawn_nearby_chunks(_gx,_gy)
{
	// Right/left
	if (_gx != hgx)
	{
		var _xdir = (_gx - hgx) * RENDER_DIST;
		
		// Spawn chunks
		for (var _i = -RENDER_DIST; _i < RENDER_DIST+1; _i++)
		{
			spawn_chunk(_gx+_xdir,_gy+_i);
		}
	}
	// Bottom/top
	else if (_gy != hgy)
	{
		var _ydir = (_gy - hgy) * RENDER_DIST;
		
		// Spawn chunks
		for (var _i = -RENDER_DIST; _i < RENDER_DIST+1; _i++)
		{
			spawn_chunk(_gx+_i,_gy+_ydir);
		}
	}
}


/// @func	despawn_far_chunks({int} gx,{int} gy);
/// @desc	Despawns chunks far enough from given position.
function despawn_far_chunks(_gx,_gy)
{	
	// Right/left
	if (_gx != hgx)
	{
		var _xdir = (_gx - hgx) * -(RENDER_DIST+1);
		
		// Despawn chunks
		for (var _i = -RENDER_DIST; _i < RENDER_DIST+1; _i++)
		{
			despawn_chunk(_gx+_xdir,_gy+_i);
		}
	}
	// Bottom/top
	else if (_gy != hgy)
	{
		var _ydir = (_gy - hgy) * -(RENDER_DIST+1);
		
		// Despawn chunks
		for (var _i = -RENDER_DIST; _i < RENDER_DIST+1; _i++)
		{
			despawn_chunk(_gx+_i,_gy+_ydir);
		}
	}
}


/// @func	spawn_chunk({int} gx,{int} gy);
/// @desc	Spawns chunk at given position.
function spawn_chunk(_gx,_gy)
{
	// Check if coordinate out of bounds of array
	if (_gx < 0 || _gy < 0 || _gx > map_size_x-1 || _gy > map_size_y-1)
	{
		// Fail
		return -1;
	}
	
	// Fill world tiles
	var _biome = world_data[_gx][_gy];
	for (var _i = 0; _i < TILES_PER_CHUNK; _i++)
	{
		for (var _j = 0; _j < TILES_PER_CHUNK; _j++)
		{
			var _x = _gx * TILE_SIZE * TILES_PER_CHUNK + _i * TILE_SIZE, _y = _gy * TILE_SIZE * TILES_PER_CHUNK + _j * TILE_SIZE;
			tilemap_set_at_pixel(world_tiles,_biome,_x,_y);
		}
	}
	
	// Check if water chunk
	if (_biome == 1)
	{
		for (var _i = 0; _i < TILES_PER_CHUNK; _i++)
		{
			for (var _j = 0; _j < TILES_PER_CHUNK; _j++)
			{
				// Set water collision tile
				tilemap_set_at_pixel(collision_tiles,CollisionTile.WATER,_x,_y);
			}
		}
	}
	
	// Generate the rest of chunk from a pool
	switch (_biome)
	{
		case Biome.OCEAN:
			spawn_ocean_environment(_gx,_gy);
			break;
		case Biome.DIRT:
			spawn_dirt_environment(_gx,_gy);
			break;
		case Biome.GRASS:
			spawn_grass_environment(_gx,_gy);
			break;
		case Biome.ROCK:
			spawn_rock_environment(_gx,_gy);
			break;
		case Biome.SNOW:
			spawn_snow_environment(_gx,_gy);
			break;
	}
	
	// Success
	return 1;
}


/// @func	despawn_chunk({int} gx,{int} gy);
/// @desc	Despawns chunk at given position.
function despawn_chunk(_gx,_gy)
{
	// Check if coordinate out of bounds of array
	if (_gx < 0 || _gy < 0 || _gx > map_size_x-1 || _gy > map_size_y-1)
	{
		// Fail
		return -1;
	}
	
	for (var _i = 0; _i < TILES_PER_CHUNK; _i++)
	{
		for (var _j = 0; _j < TILES_PER_CHUNK; _j++)
		{
			var _x = _gx * TILE_SIZE * TILES_PER_CHUNK + _i * TILE_SIZE, _y = _gy * TILE_SIZE * TILES_PER_CHUNK + _j * TILE_SIZE;
			tilemap_set_at_pixel(world_tiles,0,_x,_y);
			tilemap_set_at_pixel(overworld_tiles,0,_x,_y);
			tilemap_set_at_pixel(collision_tiles,CollisionTile.EMPTY,_x,_y);
			tilemap_set_at_pixel(sky_tiles,0,_x,_y);
		}
	}
	
	// Success
	return 1;
}