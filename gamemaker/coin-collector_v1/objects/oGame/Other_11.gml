/// @desc Restart

// Check if white coin exists
if (!instance_exists(oCoinMode20))
{
	// Stop audio
	audio_stop_sound(mDrums);
	audio_stop_sound(mSynth);

	// Reset variables
	state = GameState.PAUSED;
	coins = 0;
	time = 0;
	time_step = 0;
	
	// Despawn all coins
	instance_destroy(oCoin);
	instance_destroy(oCoinBouncer);

	// Spawn white coin
	instance_create_layer(320,64,"Instances",oCoinMode20)
	
	// Stop alarm
	alarm[0] = -1;
}