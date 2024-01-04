/// @func	check_hud_collision(_x,_y);
/// @desc	Checks if given input position collides with any hud elements and returns a value

function check_hud_collision(_x,_y)
{
	// Check if paused
	if (paused == 1)
	{
		// Check resume button
		if (check_button_collision(_x,_y,resume_button_x,resume_button_y,resume_button_width,resume_button_height))
		{
			paused = 0;
		}
		// Check quit button
		else if (check_button_collision(_x,_y,restart_button_x,restart_button_y,restart_button_width,restart_button_height))
		{
			room_restart();
		}
		// Check quit button
		else if (check_button_collision(_x,_y,quit_button_x,quit_button_y,quit_button_width,quit_button_height))
		{
			game_end();
		}
		return true;
	}
	// Check hud collision
	else
	{
		// Check camera button
		if (check_button_collision(_x,_y,camera_button_x,camera_button_y,camera_button_width,camera_button_height))
		{
			if (state_name == "Free")
			{
				state_switch("Follow");
			}
			else
			{
				state_switch("Free");
			}
			return true;
		}
		// Check spawn button
		else if (check_button_collision(_x,_y,spawn_button_x,spawn_button_y,spawn_button_width,spawn_button_height))
		{
			if (can_spawn == 1)
			{
				can_spawn = 0;
			}
			else
			{
				can_spawn = 1;
			}
			return true
		}
		// Check pause button
		else if (check_button_collision(_x,_y,pause_button_x,pause_button_y,pause_button_width,pause_button_height))
		{
			if (paused)
			{
				paused = 0;
			}
			else
			{
				paused = 1;
			}
			return true;
		}
		return false;
	}
}


/// @func	check_button_collision(_x,_y,_bx,_by,_width,_height);
/// @desc	Checks if given input position collides with button and returns a value

function check_button_collision(_x,_y,_bx,_by,_width,_height)
{
	// Check if point is located between button collision
	if (_x > _bx && _x < _bx+_width && _y > _by && _y < _by+_height)
	{
		return true;
	}
	return false;
}