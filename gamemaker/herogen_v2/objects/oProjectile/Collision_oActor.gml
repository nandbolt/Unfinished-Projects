/// @desc Event

// Check if not owner
if (instance_exists(owner) && owner.id != other.id)
{
	with (other)
	{
		// Check drop
		if (drop != noone && object_exists(drop))
		{
			instance_create_layer(x,y,"Instances",drop);
		}
		
		// Actor death particles
		var _x = x, _y = y;
		with (oParticles)
		{
			part_particles_create(psystem,_x,_y,ptype_generic,5);
		}
		
		// Destroy actor
		instance_destroy();
	}
	
	// Destroy projectile
	instance_destroy();
}