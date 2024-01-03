/// @desc Mode Complete

// Update high score
show_debug_message("TIME: " + string(millisecs));
show_debug_message("FASTEST TIME: " + string(button.scores[button.modeIdx]));
if (millisecs < button.scores[button.modeIdx])
{
	button.scores[button.modeIdx] = millisecs;
	oWorld.scoreText = "NEW FASTEST TIME: " + string(millisecs);
	oWorld.alarm[0] = 300;
}

// Stop music
audio_stop_sound(musTrack1);

// Play jingle
audio_play_sound(musJingle1,2,false);

// Destroy self
instance_destroy();