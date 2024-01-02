/// @desc Update controller every gamestep
if (active)
{
	control.step();
	
	// check activity
	if (!control.active)
	{
		with (oWorldGen)
		{
			event_user(0);
		}
	}
}