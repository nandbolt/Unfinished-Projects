/// @desc Despawn Timer

// Check if farther than despawn distance
if (get_manhattan_distance(x,y,oCamera.x,oCamera.y) > despawn_dist)
{
	// Despawn
	instance_destroy();
}
else
{
	// Restart despawn timer
	alarm[0] = time_to_despawn;
}