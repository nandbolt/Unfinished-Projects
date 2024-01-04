/// @desc Display Stats

// Self
draw_self();

// Health
draw_healthbar(x-6,y-26,x+6,y-25,curr_hp,c_black,c_red,c_green,0,true,false);

// Hunger
draw_healthbar(x-6,y-24,x+6,y-23,curr_hunger,c_black,c_red,c_olive,0,true,false);

// Debug
if (debug_mode)
{
	// Draw grid
	if (main_character && ds_exists(my_pathfinding_grid,ds_type_grid))
	{
		for (var i=0; i<ds_grid_width(my_pathfinding_grid); i++)
		{
			for (var j=0; j<ds_grid_height(my_pathfinding_grid); j++)
			{
				var value = ds_grid_get(my_pathfinding_grid,i,j);
				draw_text_ext_color(i*obj_grid.cell_width+8,j*obj_grid.cell_height,string(value),0,300,c_white,c_white,c_white,c_white,0.25);
			}
		}
	}
	
	// Draw path
	if (path_exists(curr_path))
	{
		draw_path(curr_path,floor(x/obj_grid.cell_width),floor(y/obj_grid.cell_height),true);
	}
	
	// State
	draw_text_ext_color(x-16,y-48,string(state_name),0,300,c_white,c_white,c_white,c_white,0.5);
	
	// AI State
	draw_text_ext_color(x-16,y-64,string(my_brain.state_name),0,300,c_white,c_white,c_white,c_white,0.5);
}