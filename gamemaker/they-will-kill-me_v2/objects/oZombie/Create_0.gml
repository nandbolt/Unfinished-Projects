/// @desc Declare variables
event_inherited();

// Life States
enum ZombieLifeState
{
	ALIVE,
	DEAD,
	RESPAWNING
}

// Mental States
enum ZombieMentalState
{
	ADVENTUROUS,
	FOCUSED,
	COMBATIVE,
	DANGERED
}

// Physical States
enum ZombiePhysicalState
{
	GROUNDED,
	AIRBOURNE,
	UNDERWATER
}

// Movement
horizontal_speed = 0;
vertical_speed = 0;
gravity_accel = 0.4;
walk_speed = 2;
swim_speed = 1;
jump_speed = 12;

// Pathfinding
pathfinding_freq = 240;
path_color = c_red;