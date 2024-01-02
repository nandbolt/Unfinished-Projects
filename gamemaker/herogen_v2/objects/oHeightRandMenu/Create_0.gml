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

// Divisions
slider_divs = new Slider("Divisions",cx,cy,0,41,1,4);
cy += yincr;

// Generate button
button_generate.x = cx;
button_generate.y = cy;
button_generate.on_click = function()
{
	// Get parameters
	var _low = slider_lowheight.get();
	var _max = slider_maxheight.get();
	var _divs = slider_divs.get();
	
	// Generate new world
	with (oWorldGen)
	{
		clear_map(height_tiles);
		generate_height_rand(_low,_max,_divs);
	}
}