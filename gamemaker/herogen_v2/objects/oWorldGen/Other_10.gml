/// @desc Next Menu

// Destroy old menu
with (prev_menu)
{
	instance_destroy();
}

// Choose correct menu type
switch (curr_menu_idx)
{
	// Height menus
	case 0:
		curr_menu = instance_create_layer(0,0,"GuiInstances",height_menus[curr_height_menu_idx]);
		break;
	// Biome menus
	case 1:
		curr_menu = instance_create_layer(0,0,"GuiInstances",biome_menus[curr_biome_menu_idx]);
		break;
	// Finish menus
	case 2:
		curr_menu = instance_create_layer(0,0,"GuiInstances",oFinishWorldGenMenu);
		break;
}