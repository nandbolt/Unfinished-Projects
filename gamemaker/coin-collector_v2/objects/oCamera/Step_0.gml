/// @desc Logic

// Check if active
if (active)
{
	// Follow object
	var _x_off = floor((x_to-x)/50);
	var _y_off = floor((y_to-y)/10);
	x = clamp(x+_x_off,width/2,room_width-(width/2));
	y = clamp(y+_y_off,height/2,room_height-(height/2));
	//x = clamp(x_to,width/2,room_width-(width/2));
	//y = clamp(y_to,height/2,room_height-(height/2));

	// Check if followed object exists
	if (followed_obj != noone && instance_exists(oPlayer))
	{
		x_to = followed_obj.x;
		y_to = followed_obj.y;
	}

	// Clamp and set position
	var _vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
	camera_set_view_mat(camera,_vm);
}