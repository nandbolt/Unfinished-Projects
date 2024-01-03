/// @desc Create Grid
var hcells = ceil(room_width/cell_width);
var vcells = ceil(room_height/cell_height);
global.pathfinding_grid = ds_grid_create(hcells,vcells);
for (var i=0; i<hcells; i+=1)
{
	for (var j=0; j<vcells; j+=1)
	{
		if (place_meeting(i*cell_width,j*cell_height,oWall))
		{
			ds_grid_add(global.pathfinding_grid,i,j,-1);
		}
		else
		{
			ds_grid_add(global.pathfinding_grid,i,j,0);
		}
	}
}