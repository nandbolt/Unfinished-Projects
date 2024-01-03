/// @desc Logic

// Inherit the parent event
event_inherited();

if (active)
{
	// Move background
	layer_x("Background",x-320);
	layer_y("Background",y-180);
}