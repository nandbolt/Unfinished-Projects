/// @desc Core Logic

// Move cloud
x += 10 /game_get_speed(gamespeed_fps);

// Check if off screen right
if (x > room_width+(sprite_width/2))
{
	instance_destroy();
}

// Check if nimbus
if (nimbus)
{
	// Check if trying to spawn something
	if (alarm[0] == -1)
	{
		// Spawn droplet
		var _droplet = instance_create_layer(x+random_range(-sprite_width/3,sprite_width/3),y,"Instances",oDropletWater);
		
		// Adjust accuracy
		_droplet.xspd = 1;
	
		// Start timer
		alarm[0] = game_get_speed(gamespeed_fps) * sec_between_drops;
	}
}