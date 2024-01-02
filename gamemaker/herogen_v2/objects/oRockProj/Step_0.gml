/// @desc Event

// Deaccelerate rock
xspd *= deaccel;
yspd *= deaccel;
if (abs(xspd) + abs(yspd) < stop_spd)
{
	// Check if not above water
	if (tilemap_get_at_pixel(collision_map,x,y) != 2)
	{
		// Leave/destroy rock
		var _rock = instance_create_layer(x,y,"Instances",oRock);
		with (_rock)
		{
			image_angle = other.rot;
		}
	}
	else
	{
		// Rock Sinking Particles
		with (oParticles)
		{
			part_particles_create(psystem,other.x,other.y,ptype_generic,3);
		}
	}
	instance_destroy();
}

// Inherit the parent event
event_inherited();