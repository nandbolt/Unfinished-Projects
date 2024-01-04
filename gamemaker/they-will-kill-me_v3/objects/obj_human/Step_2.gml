/// @desc Update

// Inherit the parent event
event_inherited();

// Thirst
thirst_counter++;
if (thirst_counter >= thirst_rate)
{
	curr_thirst--;
	if (curr_thirst <= 0)
	{
		curr_hp--;
		if (curr_hp <= 0)
		{
			instance_destroy();
		}
	}
	thirst_counter = 0;
}