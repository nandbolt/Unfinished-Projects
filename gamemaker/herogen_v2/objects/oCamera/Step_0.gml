/// @desc Follow Hero

// Check if hero exists
if (instance_exists(target))
{
	var _xgoal = 0, _ygoal = 0;
	
	// Center camera coordinates 
	x = camera_x + camera_width * 0.5;
	y = camera_y + camera_height * 0.5;
	
	// Check if out of rectangle
	if (target.x < x - pan_xborder || target.x > x + pan_xborder)
	{
		_xgoal = target.x - x;
	}
	if (target.y < y - pan_yborder || target.y > y + pan_yborder)
	{
		_ygoal = target.y - y;
	}
	
	// Update/clamp camera X/Y
	camera_x = clamp(camera_x + sign(_xgoal) * cameraspd,0,room_width-camera_width);
	camera_y = clamp(camera_y + sign(_ygoal) * cameraspd,0,room_height-camera_height);
}

// Set camera position
camera_set_view_pos(view_camera[0],camera_x,camera_y);