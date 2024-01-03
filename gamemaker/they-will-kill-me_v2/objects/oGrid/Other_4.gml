/// @desc Grid Setup

// Calculate Cell Count
var hcells = ceil(room_width/cell_width);
var vcells = ceil(room_height/cell_height);

// Create Grid
global.pathfinding_grid = ds_grid_create(hcells,vcells);

// Fill Grid
for (var i=0; i<hcells; i++)
{
	for (var j=0; j<vcells; j++)
	{
		if (place_meeting(i*cell_width,j*cell_height,oWall))
		{
			ds_grid_add(global.pathfinding_grid,i,j,-1);
		}
		else if (place_meeting(i*cell_width,j*cell_height,oWater))
		{
			ds_grid_add(global.pathfinding_grid,i,j,-2);
		}
		else
		{
			ds_grid_add(global.pathfinding_grid,i,j,0);
		}
	}
}