/// @desc Event

// Calculate damage
var _damage = damage;

// Check if enemy exists
if (instance_exists(other))
{
	// Update enemy
	with (other)
	{
		// Damage enemy
		hp -= _damage;
	
		// If health at or below zero
		if (hp <= 0)
		{
			// Enemy death
			event_user(0);
		}
	}
}

// Projectile death
instance_destroy();