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

#region Pathfinding

if ((alarm[0] == -1 || alarm[1] == -1) && !path_exists(pathway))
{
	// Clear Path
	hspd = 0;
	vspd = 0;
	if (path_exists(pathway))
	{
		path_delete(pathway);
	}
	path_point = 0;
	action = 0;
	jump_action = 0;
	
	// Create Goal
	var _start_x = floor(x/oGrid.cell_width), _start_y = floor(y/oGrid.cell_height);
	if (thirsty)
	{
		var _goal_x = floor(oWater.x/oGrid.cell_width), _goal_y = floor(oWater.y/oGrid.cell_height);
	}
	else
	{
		var _goal_x = floor(oBush.x/oGrid.cell_width), _goal_y = floor(oBush.y/oGrid.cell_height);
	}
	
	// Copy Grid
	if (!ds_exists(my_pathfinding_grid,ds_type_grid))
	{
		my_pathfinding_grid = ds_grid_create(ds_grid_width(global.pathfinding_grid),ds_grid_height(global.pathfinding_grid));
	}
	ds_grid_copy(my_pathfinding_grid,global.pathfinding_grid);
	
	// Find Path
	find_path(my_pathfinding_grid,convert_point_to_str(_start_x,_start_y),convert_point_to_str(_goal_x,_goal_y));
}

if (path_exists(pathway))
{
	// Follow Path
	follow_path(pathway);
}

#endregion

// Apply Gravity
vspd += grav;

#region Collisions

// Horizontal Collision
if (place_meeting(x+hspd,y,oWall))
{
	while (!place_meeting(x+sign(hspd),y,oWall))
	{
		x += sign(hspd);
	}
	hspd = 0;
}
x += hspd;

// Vertical Collision
if (place_meeting(x,y+vspd,oWall))
{
	while (!place_meeting(x,y+sign(vspd),oWall))
	{
		y += sign(vspd);
	}
	vspd = 0;
}
y += vspd;

#endregion

#region Animations

if (!place_meeting(x,y+1,oWall))
{
	sprite_index = sHumanAir;
	image_speed = 0;
	if (vspd > 0)
	{
		image_index = 1;
	}
	else
	{
		image_index = 0;
	}
}
else
{
	image_speed = 1;
	if (hspd == 0)
	{
		sprite_index = sHuman;
	}
	else
	{
		sprite_index = sHumanRun;
	}
}

if (hspd != 0)
{
	image_xscale = sign(hspd);
}

#endregion