/// @desc Init

// World Generation
worldgen_type_idx = 0;
worldgen_types = [generate_world1,generate_world2,generate_world3,generate_world4];

// World Dimensions
last_gx = ceil(room_width / TILE_SIZE);
last_gy = ceil(room_height / TILE_SIZE);

// World Info
worldname = "Earth";

// Tilesets
worldtiles = layer_tilemap_get_id("WorldTiles");

// Generate custom world file for world 1
generate_world1();