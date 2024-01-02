/// @desc Event

// Inherit the parent event
event_inherited();

// Type
label_heighttype.name += "Random";

// Low
slider_lowheight = new Slider("Lowest height",cx,cy,1,11,1,1);
cy += yincr;

// Max
slider_maxheight = new Slider("Max height",cx,cy,1,11,1,11);
cy += yincr;

// Generate button
button_generate.x = cx;
button_generate.y = cy;
button_generate.on_click = function()
{
	// Get parameters
	var _low = slider_lowheight.get();
	var _max = slider_maxheight.get();
	
	// Generate new world
	with (oWorldGen)
	{
		clear_map(height_tiles);
		generate_height2(_low,_max);
	}
}

// Generate map on new menu
button_generate.on_click();