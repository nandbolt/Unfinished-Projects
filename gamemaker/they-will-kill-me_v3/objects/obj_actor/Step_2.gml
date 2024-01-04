/// @desc Update State
state_update();

// Hunger
hunger_counter++;
if (hunger_counter >= hunger_rate)
{
	curr_hunger--;
	if (curr_hunger <= 0)
	{
		curr_hp--;
		if (curr_hp <= 0)
		{
			instance_destroy();
		}
	}
	hunger_counter = 0;
}