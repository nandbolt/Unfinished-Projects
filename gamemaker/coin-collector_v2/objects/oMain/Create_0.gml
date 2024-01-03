/// @desc Init

// Game setup
draw_set_font(fDefault);
gamepad_set_axis_deadzone(0,0.1);
//randomize();

// Spawn persistent objects
instance_create_layer(0,0,"Instances",oAudio);
instance_create_layer(0,0,"Instances",oParticles);

// Spawn logo
alarm[0] = 120;