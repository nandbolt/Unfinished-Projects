/// @desc Logic

// Check if toggle mute
if (check_input(Input.MUTE))
{
	if (mute)
	{
		// Unmute
		audio_group_set_gain(sfxs,vol_sfxs,0);
		audio_group_set_gain(music,vol_music,0);
	}
	else
	{
		// Mute
		audio_group_set_gain(sfxs,0,0);
		audio_group_set_gain(music,0,0);
	}
	
	// Set mute
	mute = !mute;
}