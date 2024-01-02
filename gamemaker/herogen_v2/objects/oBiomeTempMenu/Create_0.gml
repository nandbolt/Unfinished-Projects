/// @desc Event

// Inherit the parent event
event_inherited();

// Show Temperature Tilemap
layer_set_visible(temp_tiles,true);

// Name
label_biometype.name = "Temperature";

// Min level
slider_minlevel = new Slider("Minimum Level",cx,cy,-2,2,1,-2);
cy += yincr;

// Max level
slider_maxlevel = new Slider("Max Level",cx,cy,-2,2,1,2);
cy += yincr;

// Zones
slider_zones = new Slider("Zones",cx,cy,1,20,1,5);
cy += yincr;

// Generate button
button_generate.x = cx;
button_generate.y = cy;
button_generate.on_click = function()
{
	// Generate tiles
	var _minlevel = slider_minlevel.get()+3;
	var _maxlevel = slider_maxlevel.get()+3;
	var _zones = slider_zones.get();
	
	// Generate new world
	with (oWorldGen)
	{
		clear_map(temp_tiles);
		generate_biome_temp(_minlevel,_maxlevel,_zones);
	}
}

// Check if haven't generated precipitation
if (!oWorldGen.world_temp_gen)
{
	// Generate map on new menu
	button_generate.on_click();
	oWorldGen.world_temp_gen = true;
}