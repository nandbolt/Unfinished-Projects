/// @desc Declare variables
event_inherited();

// Life States
enum LifeState
{
	ALIVE,
	DEAD,
	RESPAWNING
}

// Mental States
enum MentalState
{
	ADVENTUROUS,
	FOCUSED,
	COMBATIVE,
	DANGERED
}

// Physical States
enum PhysicalState
{
	GROUNDED,
	AIRBOURNE,
	UNDERWATER
}

// Survival
max_thirst = 100;
curr_thirst = max_thirst;
max_hunger = 100;
curr_hunger = max_hunger;
path_color = c_lime;

// Movement
horizontal_speed = 0;
vertical_speed = 0;
gravity_accel = 0.4;
walk_speed = 4;
swim_speed = 2;
jump_speed = 8;