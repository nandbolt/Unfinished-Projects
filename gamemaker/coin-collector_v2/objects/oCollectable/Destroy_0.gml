/// @desc Cleanup

// Check if being instantly destroyed
if (state_name != "Collected")
{
	#region Airburst Particles
		
	with (oParticles)
	{
		// Emit airburst particles
		part_particles_create(part_system,other.x,other.y,part_type_airburst,1);
	}
		
	#endregion
}

// State cleanup
state_cleanup();