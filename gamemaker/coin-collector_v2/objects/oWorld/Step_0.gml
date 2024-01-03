/// @desc Logic

#region Shortcuts

// Toggle Fullscreen
if (check_input(Input.FULLSCREEN))
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

#endregion

// Check if trying to quit
if (keyboard_check(vk_escape) || gamepad_button_check(0,gp_face4))
{
	// Pixelation
	if (pixel_step > 0)
	{
		// Increment pixel step
		pixel_step--;
	
		// Check if current frame will update pixelation
		if (pixel_step mod 3 == 0)
		{
			// Resize application surface
			var _width = 16 + ((640-16)*(pixel_step/pixel_steps));
			var _height = 9 + ((360-9)*(pixel_step/pixel_steps));
			surface_resize(application_surface,_width,_height);
		}
		
		// Check if pixel step is 0
		if (pixel_step == 0)
		{
			// Quit game
			game_end();
		}
	}
}
else
{
	// Pixelation
	if (pixel_step < pixel_steps)
	{
		// Increment pixel step
		pixel_step++;
	
		// Check if current frame will update pixelation
		if (pixel_step mod 3 == 0)
		{
			// Resize application surface
			var _width = 16 + ((640-16)*(pixel_step/pixel_steps));
			var _height = 9 + ((360-9)*(pixel_step/pixel_steps));
			surface_resize(application_surface,_width,_height);
		}
	}
}