/// @desc Initialize

// States
enum CropState
{
	UNHARVESTABLE,
	HARVESTABLE
}
curr_crop_state = CropState.UNHARVESTABLE;

// Timers
growth_time = floor(irandom_range(300,600));
growth_counter = 0;