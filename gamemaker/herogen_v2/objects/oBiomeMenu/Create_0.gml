/// @desc Event

// Inherit the parent event
event_inherited();

// Show Biome Tilemap
layer_set_visible(biome_tiles,true);

// Name
label_maptype.name = "Biomes";

// Current Biome Menu
cx = sx;
cy += yincr;
label_biometype = new Label("General",cx,cy);
cx += label_biometype.width;
button_biometype_left = new Button("<",cx,cy);
button_biometype_left.on_click = function()
{
	with (oWorldGen)
	{
		// Store previous menu
		prev_menu = curr_menu;
		
		// Cycle index
		curr_biome_menu_idx--;
		if (curr_biome_menu_idx < 0) curr_biome_menu_idx = last_biome_menu_idx;
		
		// Transition to next menu
		prev_menu.control.active = false;
	}
}
button_biometype_left.width = 16;
cx += button_biometype_left.width;
button_biometype_right = new Button(">",cx,cy);
button_biometype_right.on_click = function()
{
	with (oWorldGen)
	{
		// Store previous menu
		prev_menu = curr_menu;
		
		// Cycle index
		curr_biome_menu_idx++;
		if (curr_biome_menu_idx > last_biome_menu_idx) curr_biome_menu_idx = 0;
		
		// Transition to next menu
		prev_menu.control.active = false;
	}
}
button_biometype_right.width = 16;

// Generate button
cx = sx;
cy += yincr;
button_generate = new Button("Generate",cx,cy);