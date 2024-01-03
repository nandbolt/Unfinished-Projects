/// @desc Force Mode End

// Stop music
audio_stop_sound(musTrack1);

// Destroy all coins
instance_destroy(oCoin);

// Destroy self
instance_destroy();