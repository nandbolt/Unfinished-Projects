/// @desc Portal Particles

// Portal particles
with (oParticles)
{
	part_particles_create(particleSystem,other.x,other.y,particlesPortal,1);
}

// Reset timer
alarm[1] = particleFrequency;