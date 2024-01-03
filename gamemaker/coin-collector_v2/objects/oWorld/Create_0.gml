/// @desc Init

// High score
scoreText = "";

// End
quitting = false;

// Pixelation
pixel_time = 2;
pixel_step = 0;
pixel_steps = pixel_time * game_get_speed(gamespeed_fps);

// Spawn world objects
instance_create_layer(128,304,"Instances",oPlayer);
var _cam = instance_create_layer(64,304,"Instances",oCameraPlayer);
view_camera[0] = _cam.camera;

// Resize pplication surface for pixel effect
surface_resize(application_surface,16,9);