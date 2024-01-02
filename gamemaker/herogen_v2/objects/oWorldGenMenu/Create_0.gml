/// @desc Create controller struct
control = new GUIElementController();
active = true;

// X/Y
sx = 16+2;
sy = 16+2;
cx = sx;
cy = sy;
yincr = 32;

// World Name
textfield_worldname = new Textfield("World Name",cx,cy,oWorldGen.world_name,"World Name");
textfield_worldname.width = 200;

// Tilesets
height_tiles = layer_tilemap_get_id("HeightTiles");
biome_tiles = layer_tilemap_get_id("BiomeTiles");
precipitation_tiles = layer_tilemap_get_id("PrecipitationTiles");
temp_tiles = layer_tilemap_get_id("TempTiles");

// World Gen Parameter
cy += yincr;
button_maptype_left = new Button("<",cx,cy);
button_maptype_left.on_click = function()
{
	with (oWorldGen)
	{
		// Store previous menu
		prev_menu = curr_menu;
		
		// Cycle menu index
		curr_menu_idx--;
		if (curr_menu_idx < 0) curr_menu_idx = last_menu_idx;
		
		// Transition to next menu
		prev_menu.control.active = false;
	}
}
button_maptype_left.width = 16;
cx += button_maptype_left.width;
label_maptype = new Label("Height Map",cx,cy);
cx += label_maptype.width;
button_maptype_right = new Button(">",cx,cy);
button_maptype_right.on_click = function()
{
	with (oWorldGen)
	{
		// Store previous menu
		prev_menu = curr_menu;
		
		// Cycle menu index
		curr_menu_idx++;
		if (curr_menu_idx > last_menu_idx) curr_menu_idx = 0;
		
		// Transition to next menu
		prev_menu.control.active = false;
	}
}
button_maptype_right.width = 16;