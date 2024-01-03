/// @desc Next Sprite

// Check if sprite was flip
if (sprite_index == sCoinCollectorFlip && state_name != "Flip")
{
	// Change to fall sprite
	sprite_index = sCoinCollectorFall;
}