/// @desc Init Game

// Font
draw_set_font(fDefault);

// Persistent
instance_create_layer(0,0,"Instances",oController);
instance_create_layer(0,0,"Instances",oParticles);

// Random
if (!debug_mode)
{
	randomize();
}