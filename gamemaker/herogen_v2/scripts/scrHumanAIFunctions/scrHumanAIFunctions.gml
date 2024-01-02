/// @func	human_update_inputs();
/// @desc	Updates human inputs based on desired needs.
function human_update_inputs()
{
	// Reset inputs
	input_left = 0;
	input_right = 0;
	input_down = 0;
	input_up = 0;
	
	// Store distance
	var _xdif = goal_x - x, _ydif = goal_y - y;
	
	// Horizontal distance
	if (abs(_xdif) > 2)
	{
		// Movement inputs
		input_left = _xdif < 0;
		input_right = !input_left;
	}
	
	// Vertical distance
	if (abs(_ydif) > 2)
	{
		// Movement inputs
		input_down = _ydif > 0;
		input_up = !input_down;
	}
	
	// Check if has target
	if (target != noone && instance_exists(target))
	{
		rot = point_direction(x,y,target.x,target.y);
		
		// Check if has rock
		if (held_item_cnt > 0)
		{
			// Execute throw stance
			action_throw_stance = true;
			
			// Increment throw timer
			throw_timer++;
			
			// Check if at max throw time
			if (throw_timer >= max_throw_timer)
			{
				action_use_item = true;
				throw_timer = 0;
			}
			else
			{
				action_use_item = false;
			}
		}
		else
		{
			action_use_item = false;
			action_throw_stance = false;
			throw_timer = 0;
		}
	}
	else
	{
		rot = point_direction(x,y,goal_x,goal_y);
		throw_timer = 0;
	}
	
	// Action inputs
	action_interact = true;
}