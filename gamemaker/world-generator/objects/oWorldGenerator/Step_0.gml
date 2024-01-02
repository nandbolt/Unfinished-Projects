/// @desc Event

// Change world generation type
var _left = keyboard_check_pressed(vk_left);
var _right = keyboard_check_pressed(vk_right);
var _space = keyboard_check_pressed(vk_space);
if (_left || _right || _space)
{
	if (_right)
	{
		// Check if last room
		if (worldgen_type_idx < array_length(worldgen_types)-1)
		{
			// Go next
			worldgen_type_idx++;
		}
		else
		{
			// Go to first world
			worldgen_type_idx = 0;
		}
	}
	else if (_left)
	{
		// Check first room
		if (worldgen_type_idx > 0)
		{
			// Go previous
			worldgen_type_idx--;
		}
		else
		{
			// Go to last world
			worldgen_type_idx = array_length(worldgen_types)-1;
		}
	}
	
	// Clear/generate world
	clear_world();
	worldgen_types[worldgen_type_idx]();
}