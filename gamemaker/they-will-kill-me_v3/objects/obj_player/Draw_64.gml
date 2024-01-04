/// @desc HUD

#region DEBUG MODE

if (debug_mode)
{
	// FPS
	draw_text((camera_width-64)/2,0,"FPS: "+string(fps));
	
	// Mouse X/Y
	draw_text((camera_width-64)/2,16,string(device_mouse_x_to_gui(0))+","+string(device_mouse_y_to_gui(0)));
}

#endregion

if (paused)
{
	// Resume button
	draw_sprite_ext(spr_button_text,0,resume_button_x,resume_button_y,1,1,0,c_white,0.5);
	
	// Restart button
	draw_sprite_ext(spr_button_text,1,restart_button_x,restart_button_y,1,1,0,c_white,0.5);
	
	// Quit button
	draw_sprite_ext(spr_button_text,2,quit_button_x,quit_button_y,1,1,0,c_white,0.5);
}
else
{
	// Currency
	draw_sprite(spr_icon_currency,0,camera_width-66,8);
	draw_text(camera_width-48,8,string(curr_currency)+"/"+string(max_currency));

	// Camera button
	var _state = 0;
	if (state_name == "Follow")
	{
		_state = 1;
	}
	draw_sprite_ext(spr_button_hud,_state,camera_button_x,camera_button_y,1,1,0,c_white,0.75);
	
	// Spawn button
	_state = can_spawn;
	draw_sprite_ext(spr_button_hud,_state+2,spawn_button_x,spawn_button_y,1,1,0,c_white,0.75);

	// Pause button
	_state = paused;
	draw_sprite_ext(spr_button_hud,_state+4,pause_button_x,pause_button_y,1,1,0,c_white,0.75);
}