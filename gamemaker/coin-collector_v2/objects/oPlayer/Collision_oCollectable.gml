/// @desc Collect

with (other)
{
	// Check if collectible is active
	if (state_name == "Active")
	{
		// Check if coin
		if (object_index == oCoin || object_is_ancestor(object_index,oCoin))
		{
			// Collect coin
			collect_coin();
			other.coins++;
		}
	}
}