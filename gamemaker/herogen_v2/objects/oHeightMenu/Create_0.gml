/// @desc Event

// Inherit the parent event
event_inherited();

// Hide Biome Tilemap
layer_set_visible(biome_tiles,false);

// Name
label_maptype.name = "Height Map";

// Height Map Types
cx = sx;
cy += yincr;
label_heighttype = new Label("Type:",cx,cy);
cx += label_heighttype.width;
button_heighttype_left = new Button("<",cx,cy);
button_heighttype_left.on_click = function()
{
	with (oWorldGen)
	{
		// Store previous menu
		prev_menu = curr_menu;
		
		// Cycle index
		curr_height_menu_idx--;
		if (curr_height_menu_idx < 0) curr_height_menu_idx = last_height_menu_idx;
		
		// Transition to next menu
		prev_menu.control.active = false;
	}
}
button_heighttype_left.width = 16;
cx += button_heighttype_left.width;
button_heighttype_right = new Button(">",cx,cy);
button_heighttype_right.on_click = function()
{
	with (oWorldGen)
	{
		// Store previous menu
		prev_menu = curr_menu;
		
		// Cycle index
		curr_height_menu_idx++;
		if (curr_height_menu_idx > last_height_menu_idx) curr_height_menu_idx = 0;
		
		// Transition to next menu
		prev_menu.control.active = false;
	}
}
button_heighttype_right.width = 16;

// Generate height map button
cx = sx;
cy += yincr;
button_generate = new Button("Generate",cx,cy);