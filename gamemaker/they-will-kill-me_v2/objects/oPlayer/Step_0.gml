/// @desc Core Logic

#region Toggle Fullscreen

if (keyboard_check_pressed(vk_f11))
{
	if (window_get_fullscreen())
	{
		window_set_fullscreen(false);
	}
	else
	{
		window_set_fullscreen(true);
	}
}

#endregion

#region Camera Controls

// Reset camera x/y
camera_x = camera_get_view_x(view_camera[0]);
camera_y = camera_get_view_y(view_camera[0]);

// Check for camera inputs
if (keyboard_check(ord("D")))
{
	camera_x += 8;
}
if (keyboard_check(ord("A")))
{
	camera_x -= 8;
}
if (keyboard_check(ord("S")))
{
	camera_y += 8;
}
if (keyboard_check(ord("W")))
{
	camera_y -= 8;
}

// Clamp and set camera position
camera_x = clamp(camera_x,0,room_width-camera_width);
camera_y = clamp(camera_y,0,room_height-camera_height);
camera_set_view_pos(view_camera[0],camera_x,camera_y);

#endregion