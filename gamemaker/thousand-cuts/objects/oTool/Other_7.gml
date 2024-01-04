/// @desc Change Sprites

// Check if finished extending
if (sprite_index == spriteExtend)
{
	// Switch to main sprite
	sprite_index = spriteMain;
}
// Check if finished retracting
else if (sprite_index == spriteRetract)
{
	// Set holding tool bool to false in owner
	with (owner)
	{
		holdingTool = false;
	}
	
	// Destroy tool
	instance_destroy();
}