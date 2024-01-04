/// @desc Spawn

// Check if right room
if (room == rNexus)
{
	// Create collision checker
	instance_create_layer(104,216,"Instances",oCollisionTester);
	
	// Visible collision tiles
	layer_set_visible("CollisionTiles",true);
}