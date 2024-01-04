/// @func	player_state_follow();
/// @desc	Player's follow state.

function player_state_follow()
{
	// Check if clicked
	if (mouse_check_button_pressed(mb_left))
	{
		// Check if clicking hud
		var _hud_clicked = check_hud_collision(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0));
		if (!_hud_clicked && can_spawn == 1)
		{
			spawn_zombie(mouse_x,mouse_y);
		}
	}
	
	// Follow object
	var _x_offset = floor((x_to - x) / 25);
	var _y_offset = floor((y_to - y) / 25);
	x = clamp(x+_x_offset,camera_width/2,room_width-(camera_width/2));
	y = clamp(y+_y_offset,camera_height/2,room_height-(camera_height/2));

	// Check if followed object exists
	if (followed_obj != noone && instance_exists(obj_human))
	{
		x_to = followed_obj.x;
		y_to = followed_obj.y;
	}

	// Clamp and set camera position
	var _vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
	camera_set_view_mat(camera,_vm);
}


/// @func	player_state_free();
/// @desc	Player's free state.

function player_state_free()
{
	// Check if clicked
	if (mouse_check_button_pressed(mb_left))
	{
		// Check if clicking hud
		var _hud_clicked = check_hud_collision(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0));
		if (!_hud_clicked)
		{
			if (can_spawn == 1)
			{
				spawn_zombie(mouse_x,mouse_y);
			}
			else
			{
				// Init drag origin point
				dragging = true;
				drag_origin_x = mouse_x;
				drag_origin_y = mouse_y;
			}
		}
	}
	else
	{
		// Check if holding click
		if (mouse_check_button(mb_left) && dragging)
		{
			var _x_offset = floor(drag_origin_x - (mouse_x - camera_get_view_x(view_camera[0])));
			if (x+_x_offset < (camera_width/2))
			{
				_x_offset = 0;
			}
			else if (x+_x_offset > room_width-(camera_width/2))
			{
				_x_offset = 0;
			}
			var _y_offset = floor(drag_origin_y - (mouse_y - camera_get_view_y(view_camera[0])));
			if (y+_y_offset < (camera_height/2))
			{
				_y_offset = 0;
			}
			else if (y+_y_offset > room_height-(camera_height/2))
			{
				_y_offset = 0;
			}
			x += _x_offset;
			y += _y_offset;
		}
		else
		{
			dragging = false;
		}
	}
	
	// Clamp and set camera position
	var _vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
	camera_set_view_mat(camera,_vm);
}