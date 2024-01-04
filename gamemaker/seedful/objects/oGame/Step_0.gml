/// @desc Core Logic

// Check if quit
if (keyboard_check_pressed(vk_backspace))
{
	game_end();
}

// Check if fullscreen
if (keyboard_check_pressed(vk_f11))
{
	if (window_get_fullscreen())
	{
		window_set_fullscreen(false);
	}
	else
	{
		window_set_fullscreen(true);
	}
}

// Check if holding screen
if (mouse_check_button(mb_left))
{
	// Check if trying to spawn something
	if (alarm[0] == -1 && mouse_y < room_height-(sprite_get_height(sGround)*2))
	{
		// Spawn droplet
		var _droplet = instance_create_layer(mouse_x,mouse_y,"Instances",oDropletWater);
		
		// Adjust accuracy
		_droplet.xspd = random_range(-spread,spread);
		_droplet.yspd = random_range(-spread,spread);
	
		// Start timer
		alarm[0] = game_get_speed(gamespeed_fps) * sec_between_drops;
	}
	
	// Check if max spread
	if (spread < max_spread)
	{
		// Increment spread
		spread += spread_accel * (1/game_get_speed(gamespeed_fps));
	}
}
else
{
	// Reset spread
	spread = 0;
}