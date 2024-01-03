/// @func	collectable_state_inactive();
/// @desc	Collectable's inactive state.

function collectable_state_inactive()
{
	// Check if switching to state
	if (state_new)
	{
		// Set sprite alpha
		image_alpha = 0.25;
	}
}


/// @func	collectable_state_active();
/// @desc	Collectable's active state.

function collectable_state_active()
{
	// Check if switching to state
	if (state_new)
	{
		// Set sprite alpha
		image_alpha = 1;
	}
}


/// @func	collectable_state_collected();
/// @desc	Collectable's collected state.

function collectable_state_collected()
{
	// Check if switching to state
	if (state_new)
	{
		// Set sprite alpha
		image_alpha = 1;
		
		// Collect sfx
		audio_play_sound(sfxCollectCoin,1,false);
	}
	
	// Check if not transparent
	if (image_alpha > 0)
	{
		// Decrement alpha
		image_alpha -= fade_spd;
		
		// Move up
		y -= fade_y_spd;
	}
	else
	{
		// Destroy self
		instance_destroy();
	}
}