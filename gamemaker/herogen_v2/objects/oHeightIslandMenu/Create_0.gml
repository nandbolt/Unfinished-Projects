/// @desc Event

// Inherit the parent event
event_inherited();

// Type
label_heighttype.name += "Islands";

// Low height
slider_lowheight = new Slider("Lowest height",cx,cy,1,11,1,1);
cy += yincr;

// Max height
slider_maxheight = new Slider("Max height",cx,cy,1,11,1,11);
cy += yincr;

// Minimum islands
slider_minlands = new Slider("Minimum islands",cx,cy,0,20,1,1);
cy += yincr;

// Max islands
slider_maxlands = new Slider("Max islands",cx,cy,0,20,1,20);
cy += yincr;

// Minimum size
slider_minsize = new Slider("Minimum size",cx,cy,1,1000,1,250);
cy += yincr;

// Max size
slider_maxsize = new Slider("Max size",cx,cy,1,1000,1,1000);
cy += yincr;

// Generate button
button_generate.x = cx;
button_generate.y = cy;
button_generate.on_click = function()
{
	// Get parameters
	var _low = slider_lowheight.get();
	var _max = slider_maxheight.get();
	var _minlands = slider_minlands.get();
	var _maxlands = slider_maxlands.get();
	var _minsize = slider_minsize.get();
	var _maxsize = slider_maxsize.get();
	
	// Generate new world
	with (oWorldGen)
	{
		clear_map(height_tiles);
		generate_height_island(_low,_max,_minlands,_maxlands,_minsize,_maxsize);
	}
}