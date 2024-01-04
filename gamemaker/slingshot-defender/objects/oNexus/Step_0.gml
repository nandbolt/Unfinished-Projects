/// @desc Update

// Fullscreen
if (keyboard_check_pressed(vk_f11)) window_set_fullscreen(!window_get_fullscreen());

// Check if build mode
if (buildMode)
{
	// Check if trying to build on valid spot
	if (mouse_check_button_pressed(mb_left) && tilemap_get_at_pixel(gridMap,mouse_x,mouse_y) > 0)
	{
		if (tilemap_get_at_pixel(collisionMap,mouse_x,mouse_y) == 0)
		{
			// Build wall
			tilemap_set_at_pixel(collisionMap,1,mouse_x,mouse_y);
			tilemap_set_at_pixel(worldMap,3,mouse_x,mouse_y);
		}
		else
		{
			// Destroy wall
			tilemap_set_at_pixel(collisionMap,0,mouse_x,mouse_y);
			tilemap_set_at_pixel(worldMap,0,mouse_x,mouse_y);
		}
		
		// Update vector field
		with (oNavMesh)
		{
			updatePathGrid(floor(mouse_x / TILE_SIZE)-1, floor(mouse_y / TILE_SIZE)-1);
		}
	}
}

// Update gui
guiController.step();