/// @desc Core Logic

// Count till harvestable
if (curr_crop_state == CropState.UNHARVESTABLE)
{
	growth_counter++;
	if (growth_counter >= growth_time)
	{
		curr_crop_state = CropState.HARVESTABLE;
		image_index = 1;
		growth_counter = 0;
	}
}