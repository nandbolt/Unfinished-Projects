/// @desc Init

// Volume
vol_sfxs = 0.5;
vol_music = 0.4;
mute = true;

// Load audio groups
audio_group_load(sfxs);
audio_group_load(music);

// Set volume
audio_group_set_gain(sfxs,0,0);
audio_group_set_gain(music,0,0);