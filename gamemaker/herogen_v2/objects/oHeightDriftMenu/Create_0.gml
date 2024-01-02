/// @desc Event

// Inherit the parent event
event_inherited();

// Type
label_heighttype.name += "Diagonal";

// Low
slider_lowheight = new Slider("Lowest height",cx,cy,1,11,1,1);
cy += yincr;

// Max
slider_maxheight = new Slider("Max height",cx,cy,1,11,1,11);
cy += yincr;

// Root Height
slider_rootheight = new Slider("Root height",cx,cy,0,11,1,0);
cy += yincr;

// Root Row
checkbox_rootrow = new Checkbox("Root row",cx,cy,false);
cy += yincr;

// Root Column
checkbox_rootcolumn = new Checkbox("Root column",cx,cy,false);
cy += yincr;

// Generate button
button_generate.x = cx;
button_generate.y = cy;
button_generate.on_click = function()
{
	// Get parameters
	var _low = slider_lowheight.get();
	var _max = slider_maxheight.get();
	var _root_height = slider_rootheight.get();
	var _root_row = checkbox_rootrow.get();
	var _root_column = checkbox_rootcolumn.get();
	
	// Generate new world
	with (oWorldGen)
	{
		clear_map(height_tiles);
		generate_height_drift(_low,_max,_root_height,_root_row,_root_column);
	}
}