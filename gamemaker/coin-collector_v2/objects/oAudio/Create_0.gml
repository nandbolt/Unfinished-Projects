/// @desc Init

// Volume
vol_sfxs = 0.7;
vol_music = 0.6;
mute = false;

// Load audio groups
audio_group_load(sfxs);
audio_group_load(music);

// Set volume
audio_group_set_gain(sfxs,vol_sfxs,0);
audio_group_set_gain(music,vol_music,0);