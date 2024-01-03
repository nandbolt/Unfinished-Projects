/// @desc Init

// Coins
coin_arr = [];
coin_idx = 0;

// Time
steps = 0;
seconds = 0;
millisecs = 0;
steps_per_sec = game_get_speed(gamespeed_fps);

// Button
button = noone;

// Start music
audio_play_sound(musTrack1,3,true);