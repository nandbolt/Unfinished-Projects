/// @desc Event

// Inherit the parent event
event_inherited();

// Sea level
slider_sealevel = new Slider("Sea Level",cx,cy,0,11,1,oWorldGen.world_sealevel);
cy += yincr;

// Grass level
slider_grasslevel = new Slider("Grass Level",cx,cy,1,11,1,oWorldGen.world_grasslevel);
cy += yincr;

// Low
slider_snowlevel = new Slider("Snow Level",cx,cy,0,11,1,oWorldGen.world_snowlevel);
cy += yincr;

// Generate button
button_generate.x = cx;
button_generate.y = cy;
button_generate.on_click = function()
{
	// Generate tiles
	var _sealevel = slider_sealevel.get();
	var _grasslevel = slider_grasslevel.get();
	var _snowlevel = slider_snowlevel.get();
	
	// Generate new world
	with (oWorldGen)
	{
		clear_map(biome_tiles);
		generate_biome_general(_sealevel,_grasslevel,_snowlevel);
	}
}

// Generate map on new menu
button_generate.on_click();