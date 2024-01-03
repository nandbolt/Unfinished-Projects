/// @desc Collect Coin

// Check if game is not finished
if (state != GameState.FINISHED)
{
	// Increment coin
	coins++;

	// Check if max coins
	if (coins < max_coins)
	{
		if (round(coins) == round(max_coins/2))
		{
			audio_sound_gain(mSynth,1,0);
		}
	}
	else
	{
		// Finish game
		state = GameState.FINISHED;
		audio_stop_sound(mDrums);
		audio_stop_sound(mSynth);
		audio_play_sound(mImWealthyNow,2,false);
		instance_destroy(oCoin);
		instance_destroy(oCoinBouncer);
		
		#region Save
		
		// Open file
		ini_open("save_data.ini");
		
		// Write to file
		total_coins += coins;
		ini_write_real("Stats","total_coins",total_coins);
		if (time < fastest_time)
		{
			fastest_time = time;
			ini_write_real("Stats","fastest_time",fastest_time);
		}
		
		// Close file
		ini_close();
		
		#endregion
		
		// Set alarm
		alarm[0] = 5 * game_get_speed(gamespeed_fps);
	}
}