/// @desc Dinner Time

with (other)
{
	if (curr_crop_state == CropState.HARVESTABLE)
	{
		// Harvest crop
		curr_crop_state = CropState.UNHARVESTABLE;
		image_index = 0;
		
		// Eat crop
		if (other.curr_hunger + 25 > other.max_hunger)
		{
			other.curr_hunger = 100;
		}
		else
		{
			other.curr_hunger += 25;
		}
	}
}