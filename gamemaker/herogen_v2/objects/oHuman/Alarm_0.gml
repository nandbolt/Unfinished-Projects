/// @desc Hunger Timer

// Increment hunger counter
hunger_cnt++;

// Check if at max hunger
if (hunger_cnt >= max_hunger_cnt)
{
	// Die
	instance_destroy();
}
else
{
	// Restart timer
	alarm[0] = hunger_time;
}