/// @desc Grid Setup

// Calculate cell count
var _hcells = ceil(room_width/cell_width);
var _vcells = ceil(room_height/cell_height);

// Create pathfinding grid
global.pathfinding_grid = ds_grid_create(_hcells,_vcells);

// Fill pathfinding grid
for (var i = 0; i < _hcells; i++)
{
	for (var j = 0; j < _vcells; j++)
	{
		if (place_meeting(i*cell_width,j*cell_height,obj_wall))
		{
			ds_grid_add(global.pathfinding_grid,i,j,-1);
		}
		else
		{
			ds_grid_add(global.pathfinding_grid,i,j,0);
		}
	}
}

// Create spawning grid
global.spawning_grid = ds_grid_create(_hcells,_vcells);

// Fill spawning grid
for (var i = 0; i < _hcells; i++)
{
	for (var j = 0; j < _vcells; j++)
	{
		if (place_meeting(i*cell_width,j*cell_height,obj_spawn))
		{
			ds_grid_add(global.spawning_grid,i,j,1);
		}
		else
		{
			ds_grid_add(global.spawning_grid,i,j,0);
		}
	}
}

// Start game
with (obj_game)
{
	event_user(0);
}