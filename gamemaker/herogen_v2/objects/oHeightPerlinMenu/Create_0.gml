/// @desc Event

// Inherit the parent event
event_inherited();

// Type
label_heighttype.name += "Perlin";

// Low
slider_lowheight = new Slider("Lowest height",cx,cy,1,11,1,1);
cy += yincr;

// Max
slider_maxheight = new Slider("Max height",cx,cy,1,11,1,11);
cy += yincr;

// Octaves
slider_octaves = new Slider("Octaves",cx,cy,0,12,1,3);
cy += yincr;

// Persistence
slider_persistence = new Slider("Persistence",cx,cy,0,12,1,2);
cy += yincr;

// Resolution
slider_resolution = new Slider("Resolution",cx,cy,4,64,4,16);
cy += yincr;

// X Offset
slider_xoff = new Slider("X Offset",cx,cy,-128,128,8,0);
cy += yincr;

// Y Offset
slider_yoff = new Slider("Y Offset",cx,cy,-128,128,8,0);
cy += yincr;

// Generate button
button_generate.x = cx;
button_generate.y = cy;
button_generate.on_click = function()
{
	// Get parameters
	var _low = slider_lowheight.get();
	var _max = slider_maxheight.get();
	var _octaves = slider_octaves.get();
	var _persistence = slider_persistence.get();
	var _resolution = slider_resolution.get();
	var _xoff = slider_xoff.get();
	var _yoff = slider_yoff.get();
	
	// Generate new world
	with (oWorldGen)
	{
		clear_map(height_tiles);
		generate_height_perlin(_low,_max,_octaves,_persistence,_resolution,_xoff,_yoff);
	}
}