/// @desc Logic

// Toggle Fullscreen
if (keyboard_check_pressed(vk_f11) || gamepad_button_check_pressed(0,gp_select))
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

// Toggle restart
if (keyboard_check_pressed(ord("R")) || gamepad_button_check_pressed(0,gp_start))
{
	event_user(1);
}

// Toggle quit
if (keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(0,gp_face4))
{
	game_end();
}

switch (state)
{
	case GameState.ACTIVE:
		// Increment timestep
		time_step++;
		
		// Check if next increment
		if (time_step >= 60)
		{
			time++;
			time_step = 0;
		}
		break;
}