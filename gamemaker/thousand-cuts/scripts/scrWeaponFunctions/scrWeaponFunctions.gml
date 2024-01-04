/// @func	weaponAttack({id} idEnemy);
/// @desc	Attacks the given enemy with the current weapon.
function weaponAttack(_idEnemy)
{
	// Add to hitlist
	ds_list_add(hitList,_idEnemy);
	
	// Update enemy
	with (_idEnemy)
	{
		// Damage
		hp -= other.damage;
		show_debug_message(string(hp));
		
		// Check if rigid body
		if (isRigidBody)
		{
			// Apply knockback
			velocity.x += lengthdir_x(other.mass*3,other.image_angle);
			velocity.y += lengthdir_y(other.mass*3,other.image_angle);
		}
				
		// Emit particles
		with (oParticles)
		{
			part_particles_create(particleSystem,other.x,other.y,particleDebris,3);
		}
				
		// Check if hp below zero
		if (hp <= 0)
		{
			// Destroy instance
			instance_destroy();
		}
	}
}