/// @desc Init

// Room Dimensions
rm_center_x = room_width * 0.5;
rm_center_y = room_height * 0.5;

// Map
map_cell_size = 8;
map_size_x = 37;
map_size_y = 41;
map_border_scale_x = (1/3)*(map_size_x+2);
map_border_scale_y = (1/3)*(map_size_y+2);

// Menu Display
menu_center_x = room_width * 0.25;
menu_center_y = room_height * 0.25;
menu_border_scale_x = (1/3)*(map_size_x+1);
menu_border_scale_y = (1/3)*(map_size_y+2);

// Menu Options
curr_menu_idx = 0;
last_menu_idx = 2;
height_menus = [oHeightIslandMenu,oHeightDriftMenu,oHeightPerlinMenu,oHeightRandMenu];
biome_menus = [oBiomeGeneralMenu,oBiomePrecipitationMenu,oBiomeTempMenu];
curr_height_menu_idx = 0;
last_height_menu_idx = array_length(height_menus)-1;
curr_biome_menu_idx = 0;
last_biome_menu_idx = array_length(biome_menus)-1;

#region World Parameters

world_name = "";
world_sealevel = 1;
world_grasslevel = 5;
world_snowlevel = 11;
world_precipitation_gen = false;
world_temp_gen = false;

#endregion

// Tilesets
height_tiles = layer_tilemap_get_id("HeightTiles");
biome_tiles = layer_tilemap_get_id("BiomeTiles");
precipitation_tiles = layer_tilemap_get_id("PrecipitationTiles");
temp_tiles = layer_tilemap_get_id("TempTiles");

// Create map menu
curr_menu = instance_create_layer(0,0,"GuiInstances",height_menus[curr_height_menu_idx]);
prev_menu = curr_menu;

// Generate first map
with (curr_menu)
{
	button_generate.on_click();
}