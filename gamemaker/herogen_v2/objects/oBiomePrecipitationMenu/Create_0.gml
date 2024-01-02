/// @desc Event

// Inherit the parent event
event_inherited();

// Show Precipitation Tilemap
layer_set_visible(precipitation_tiles,true);

// Name
label_biometype.name = "Precipitation";

// Min level
slider_minlevel = new Slider("Minimum Level",cx,cy,0,3,1,0);
cy += yincr;

// Max level
slider_maxlevel = new Slider("Max Level",cx,cy,0,3,1,3);
cy += yincr;

// Zones
slider_zones = new Slider("Zones",cx,cy,1,20,1,4);
cy += yincr;

// Generate button
button_generate.x = cx;
button_generate.y = cy;
button_generate.on_click = function()
{
	// Generate tiles
	var _minlevel = slider_minlevel.get();
	var _maxlevel = slider_maxlevel.get();
	var _zones = slider_zones.get();
	
	// Generate new world
	with (oWorldGen)
	{
		clear_map(precipitation_tiles);
		generate_biome_precipitation(_minlevel,_maxlevel,_zones);
	}
}

// Check if haven't generated precipitation
if (!oWorldGen.world_precipitation_gen)
{
	// Generate map on new menu
	button_generate.on_click();
	oWorldGen.world_precipitation_gen = true;
}