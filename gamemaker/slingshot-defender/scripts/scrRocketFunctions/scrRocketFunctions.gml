/// @func	rocketExplode();
/// @desc	Explodes rocket, damaging nearby enemies and leaving particles.
function rocketExplode()
{
	// Calculate explosion damage
	var _damage = explosionDamage;
	
	// Update enemy
	with (oEnemy)
	{
		// If enemy within explosion radius
		if (distance_to_point(other.x,other.y) < other.explosionRadius)
		{
			// Damage enemy
			hp -= _damage;
			
			// If at or below zero
			if (hp <= 0)
			{
				// Enemy death
				event_user(0);
			}
		}
	}
	
	// Explosion particles
	with (oParticles)
	{
		repeat (other.explosionRadius * 3)
		{
			var _angle = random(360), _radius = random(other.explosionRadius);
			var _x = other.x + lengthdir_x(_radius,_angle), _y = other.y + lengthdir_y(_radius,_angle);
			part_particles_create(particleSystem,_x,_y,particlesEnemyDeath,1);
		}
	}
}