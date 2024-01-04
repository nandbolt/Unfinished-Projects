/// @desc Cloud Spawning

// Spawn cloud
instance_create_layer(-sprite_get_width(sCloud)/2,irandom_range(32,96),"Instances",oCloud);

// Reset alarm
alarm[1] = game_get_speed(gamespeed_fps) * 12;