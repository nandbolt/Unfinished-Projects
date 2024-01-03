/// @desc Logic

// Increment step
steps++;
millisecs = steps/steps_per_sec;
if (steps mod steps_per_sec == 0)
{
	seconds++;
	millisecs = 0;
}
show_debug_message("TIME: " + string(millisecs));
show_debug_message("FASTEST TIME: " + string(button.scores[button.modeIdx]));