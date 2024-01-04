/// @desc Debug

// Draw grid
//if (ds_exists(global.pathfinding_grid,ds_type_grid))
//{
//	for (var i=0; i<ds_grid_width(global.pathfinding_grid); i++)
//	{
//		for (var j=0; j<ds_grid_height(global.pathfinding_grid); j++)
//		{
//			var _c = c_dkgray;
//			if (ds_grid_get(global.pathfinding_grid,i,j) == -1)
//			{
//				_c = c_white;
//			}
//			else if (ds_grid_get(global.spawning_grid,i,j) == 1)
//			{
//				_c = c_yellow;
//			}
//			draw_rectangle_color(i*cell_width+1,j*cell_height+1,(i*cell_width)+cell_width-2,(j*cell_height)+cell_height-2,_c,_c,_c,_c,true);
//		}
//	}
//}