/// @desc Init World

// World
world_data = [];
world_tiles = layer_tilemap_get_id("WorldTiles");
overworld_tiles = layer_tilemap_get_id("OverWorldTiles");
collision_tiles = layer_tilemap_get_id("CollisionTiles");
sky_tiles = layer_tilemap_get_id("SkyTiles");

// Entities
rock_cnt = 5;
max_rock_cnt = 10;
spawn_freq = 60;

// Actors
actor_cnt = 0;
max_actor_cnt = 5;

// Get world data
array_copy(world_data,0,oWorldGenToWorld.world_data,0,array_length(oWorldGenToWorld.world_data));

// Size
map_size_x = array_length(world_data);
map_size_y = array_length(world_data[0]);

// Hero
hero = noone;
hgx = irandom(map_size_x-1);
hgy = irandom(map_size_y-1);
hgx = 5;
hgy = 8;

// Delete transfer object (Don't delete, or else room_restart() wont work)
// instance_destroy(oWorldGenToWorld);

// Spawn nearby chunks
for (var _j = -RENDER_DIST; _j < RENDER_DIST+1; _j++)
{
	for (var _i = -RENDER_DIST; _i < RENDER_DIST+1; _i++)
	{
		// Spawn new chunk
		spawn_chunk(hgx+_i,hgy+_j);
	}
}

// Spawn hero
var _hx = hgx * CHUNK_SIZE + CHUNK_SIZE * 0.5, _hy = hgy * CHUNK_SIZE + CHUNK_SIZE * 0.5;
hero = instance_create_layer(_hx,_hy,"Instances",oHero);

// Spawn camera
camera = instance_create_layer(_hx,_hy,"Instances",oCamera);

// Spawn entities
for (var _i = 0; _i < rock_cnt; _i++)
{
	var _x = irandom_range(_hx - camera.camera_width,_hx + camera.camera_width), _y = irandom_range(_hy - camera.camera_height,_hy + camera.camera_height);
	instance_create_layer(clamp(_x,0,room_width),clamp(_y,0,room_height),"Instances",oRock);
}

// Start spawn timer
alarm[0] = spawn_freq;