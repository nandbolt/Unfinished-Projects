/// @desc Init Game

// Check release mode
if (!debug_mode)
{
	randomize();
}
else
{
	instance_create_layer(0,0,"Instances",oDebug);
}

// Particles
instance_create_layer(0,0,"Instances",oParticles);