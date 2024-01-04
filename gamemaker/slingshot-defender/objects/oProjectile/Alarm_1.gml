/// @desc Trail Particles

// Trail particles
var _x = x + particleTrailXOffset, _y = y + particleTrailYOffset;
with (oParticles)
{
	part_particles_create(particleSystem,_x,_y,other.particleTrailType,1);
}

// Reset timer
alarm[1] = particleTrailFrequency;