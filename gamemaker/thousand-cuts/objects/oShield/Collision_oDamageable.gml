/// @desc Attack

// Check if not owner
if (other.id != owner.id)
{
	with (other)
	{
		// Damage other
		hp -= other.damage;
		show_debug_message(string(hp));
		
		// Check if hp below zero
		if (hp <= 0)
		{
			// Destroy other
			instance_destroy();
		}
	}
}