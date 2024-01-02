/// @desc Init

// Inherit the parent event
event_inherited();

// Movement
start_spd = 12;
deaccel = 0.95;
stop_spd = 0.5;

// Collision
collision_type = Collision.BOUNCE;

// Functions
on_collision = function()
{
	// Collision particles
	with (oParticles)
	{
		part_particles_create(psystem,other.x,other.y,ptype_generic,2);
	}
}