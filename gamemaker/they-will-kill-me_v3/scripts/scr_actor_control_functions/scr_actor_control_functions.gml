enum ActorInput
{
	STOP,
	RUN,
	JUMP,
	FALL
	
}

/// @func	actor_input(input,dir);
/// @desc	Moves actor based on inputed value.
function actor_input(_input,_dir)
{
	// Choose direction
	if (_dir > 0)
	{
		// Right
		move_right = true;
		move_left = false;
	}
	else if (_dir < 0)
	{
		// Left
		move_left = true;
		move_right = false;
	}
	else
	{
		// Neutral
		move_left = false;
		move_right = false;
	}
	
	// Choose action
	switch (_input)
	{
		case ActorInput.RUN:
			move_jump = false;
			break;
		case ActorInput.JUMP:
			move_jump = true;
			
			// Check if over target
			if (position_meeting(path_get_point_x(curr_path,curr_path_point+1),y,self.id))
			{
				move_right = false;
				move_left = false;
			}
			break;
		case ActorInput.FALL:
			move_jump = false;
			
			// Check if over target
			if (position_meeting(path_get_point_x(curr_path,curr_path_point+1),y,self.id))
			{
				move_right = false;
				move_left = false;
			}
			break;
		default:
			move_jump = false;
	}
}