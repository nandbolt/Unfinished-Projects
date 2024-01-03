/// @desc Debug

// Draw self
draw_self();

// Draw the grid
//if ds_exists(my_pathfinding_grid,ds_type_grid)
//{
//    for (var i=0; i<ds_grid_width(my_pathfinding_grid); i+=1)
//    {
//        for (var j=0; j<ds_grid_height(my_pathfinding_grid); j+=1)
//        {
//            var value = ds_grid_get(my_pathfinding_grid,i,j);
            
//            draw_text_transformed(i*oGrid.cell_width + 8, j*oGrid.cell_height + 8,string(value), 1, 1,0);
//        }
//    }
//}

/// Draw the path
if path_exists(curr_path)
{
	draw_set_color(path_color);
    draw_path(curr_path,floor(x/oGrid.cell_width), floor(y/oGrid.cell_height),true);
}