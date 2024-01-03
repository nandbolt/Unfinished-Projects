/// @desc Stats

// States
hungry = false;
thirsty = false;

// Movement
hspd = 0;		// Horizontal Speed
vspd = 0;		// Vertical Speed
grav = 0.3;		// Gravity
walk_spd = 3;	// Walk Speed
jump_spd = -6;	// Jump Speed

// Pathfinding
my_pathfinding_grid = noone;
pathway = noone;

// Follow Path
action = 0;
path_point = 0;
jump_action = 0;

// Start State Timers
alarm[0] = 1 * 60;
alarm[1] = 12 * 60;