/// @desc Init

// Movement
x_spd = 0;				// Theoretical x speed
y_spd = 0;				// Theoretical y speed
grav = 0.15;			// Gravity
wall_grav = 0.1;		// Gravity
run_spd = 3;			// Run speed
run_accel = 0.2;		// Run acceleration
air_accel = 0.1;		// Run acceleration
max_y_spd = 10;			// Max y speed
jump_force = 5;			// Jump force
wall_jump_x_force = 5;	// Wall jump x force
wall_jump_y_force = 5;	// Wall jump x force
wall_push_force = 6;	// Wall push force
wall_cancel_force = 3;	// Wall push force
move_dir = 0;			// Move direction

// States
enum PlayerState
{
	IDLE,
	RUN,
	JUMP,
	FALL,
	WALLCLING,
	WALLJUMP,
	WALLPUSH
}
state = 0;
on_ground = false;
on_wall = false;
wall_push_time = 0.25;

// Controller threshold
gamepad_set_axis_deadzone(0,0.1);