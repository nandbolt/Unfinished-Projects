/// @desc Core Logic

#region Thinking

#region States

#endregion

#region Pathfinding

if (mouse_check_button_pressed(mb_left))
{
	// Clear Path
	if (path_exists(curr_path))
	{
		path_delete(curr_path);
	}
	curr_path_point = 0;
	curr_action = 0;
	curr_jump_action = 0;
	
	// Set Start And Goal Point
	var _start_x = floor(x/oGrid.cell_width), _start_y = floor(y/oGrid.cell_height);
	var _goal_x = floor(mouse_x/oGrid.cell_width), _goal_y = floor(mouse_y/oGrid.cell_height);
	
	// Copy Grid
	if (!ds_exists(my_pathfinding_grid,ds_type_grid))
	{
		my_pathfinding_grid = ds_grid_create(ds_grid_width(global.pathfinding_grid),ds_grid_height(global.pathfinding_grid));
	}
	ds_grid_copy(my_pathfinding_grid,global.pathfinding_grid);
	
	// Find/Build Path
	human_find_path(my_pathfinding_grid,convert_point_to_str(_start_x,_start_y),convert_point_to_str(_goal_x,_goal_y));
}

if (path_exists(curr_path))
{
	// Follow Path
	human_follow_path();
}

#endregion

#endregion

#region Gravity

if (curr_physical_state != PhysicalState.UNDERWATER)
{
	vertical_speed += gravity_accel;
}

#endregion

#region Wall collisions

// Horizontal collision
if (place_meeting(x+horizontal_speed,y,oWall))
{
	while (!place_meeting(x+sign(horizontal_speed),y,oWall))
	{
		x += sign(horizontal_speed);
	}
	horizontal_speed = 0;
}
x += horizontal_speed;

// Vertical collision
if (place_meeting(x,y+vertical_speed,oWall))
{
	while (!place_meeting(x,y+sign(vertical_speed),oWall))
	{
		y += sign(vertical_speed);
	}
	vertical_speed = 0;
	
	if (curr_physical_state != PhysicalState.UNDERWATER)
	{
		// Change to grounded state
		curr_physical_state = PhysicalState.GROUNDED;
	}
}
else
{
	// Water collision
	if (place_meeting(x,y+vertical_speed,oWater))
	{
		// Change to underwater state
		curr_physical_state = PhysicalState.UNDERWATER;
	}
	else
	{
		// Change State
		curr_physical_state = PhysicalState.AIRBOURNE;
	}
}
y += vertical_speed;

#endregion