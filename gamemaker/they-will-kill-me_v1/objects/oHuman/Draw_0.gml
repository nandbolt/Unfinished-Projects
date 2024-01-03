/// @desc ???
draw_self();

// Draw survival states
var _thoughts = "...";
if (hungry && thirsty) _thoughts = "I need food and water...";
else if (hungry) _thoughts = "I need food...";
else if (thirsty) _thoughts = "I need water...";
draw_text_transformed(x-24,y-26,_thoughts,0.5,0.5,0);

// DRAW PATHFINDING GRID
//if (ds_exists(my_pathfinding_grid,ds_type_grid))
//{
//	var hcells = ceil(room_width/oGrid.cell_width);
//	var vcells = ceil(room_height/oGrid.cell_height);
//	for (var i=0; i<hcells; i+=1)
//	{
//		for (var j=0; j<vcells; j+=1)
//		{
//			var _x1 = i*oGrid.cell_width, _y1 = j*oGrid.cell_height;
//			draw_rectangle(_x1,_y1,_x1+31,_y1+31,true);
//			draw_text(_x1,_y1,string(ds_grid_get(my_pathfinding_grid,i,j)))
//		}
//	}
//}


// Draw the path
if path_exists(pathway)
{
    draw_path(pathway,floor(x/oGrid.cell_width), floor(y/oGrid.cell_height),true);
}