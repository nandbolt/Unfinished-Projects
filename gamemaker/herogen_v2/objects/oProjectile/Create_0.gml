/// @desc Init

// Owner
owner = noone;

// Movement
xspd = 0;
yspd = 0;
rxspd = 0;
ryspd = 0;

// Orientation
rot = 0;

// Tilemaps
collision_map = layer_tilemap_get_id("CollisionTiles");

// Collision
collision_type = Collision.STOP;

// Functions
on_collision = function()
{
	instance_destroy();
}