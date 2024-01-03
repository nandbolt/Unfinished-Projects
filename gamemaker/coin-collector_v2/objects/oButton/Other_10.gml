/// @desc Button Pressed

// Play sound
audio_play_sound(sfxButtonPress,2,false);

// Check if mode exists
if (!instance_exists(oMode))
{
	// Check if coin mode doesnt exists
	if (coin == noone)
	{
		// Spawn coin
		coin = instance_create_layer(coin_x,coin_y,"Instances",oCoinMode);
		setCoinMode(coin, modes[0]);
	}
	else
	{
		// Cycle to next gamemode
		modeIdx++;
		if (modeIdx < array_length(modes)) setCoinMode(coin, modes[modeIdx]);
		else
		{
			// Reset button's coin, destroy coin
			instance_destroy(coin);
			coin = noone;
			modeIdx = 0;
		}
	}
}
else
{
	with (oMode)
	{
		// Force end mode
		event_user(1);
	}
}