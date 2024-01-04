/// @desc Init

// Goal
xGridGoal = floor(oHeart.x / TILE_SIZE) - 1;
yGridGoal = floor(oHeart.y / TILE_SIZE) - 1;

// Dimensions
xGridSize = floor(room_width / TILE_SIZE) - 2;
yGridSize = floor(room_height / TILE_SIZE) - 2;

// Tilesets
collisionMap = layer_tilemap_get_id("CollisionTiles");

// Set flow field
setupPathGrid();