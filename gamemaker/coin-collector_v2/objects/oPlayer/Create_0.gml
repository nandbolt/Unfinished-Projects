/// @desc Init

// Inventory
coins = 0;

// Movement
x_spd = 0;					// Theoretical x speed
y_spd = 0;					// Theoretical y speed
grav = 0.15;				// Gravity
wall_grav = 0.1;			// Wall gravity
max_run_spd = 3;			// Max run speed
max_fall_spd = 10;			// Max fall speed
max_wall_fall_spd = 5;		// Max wall fall speed
run_accel = 0.2;			// Run acceleration
air_accel = 0.1;			// Air acceleration
jump_force = 5;				// Jump force
walljump_x_force = 5;		// Wall jump x force
walljump_y_force = 5;		// Wall jump y force
dash_x_force = 6;			// Dash x force
dash_y_force = 0;			// Dash y force
dash_cancel_y_force = 3;	// Dash cancel y force
dash_time = 0.25;			// Dash duration (sec)

// Menus
draw_select_menu = false;

// Calculate dash duration (steps)
dash_duration = round(dash_time * game_get_speed(gamespeed_fps));

#region State Machine

// Setup state machine
state_machine_init();

// Define states
state_create("Idle",player_state_idle);
state_create("Run",player_state_run);
state_create("Jump",player_state_jump);
state_create("Fall",player_state_fall);
state_create("Wallcling",player_state_wallcling);
state_create("Dash",player_state_dash);
state_create("Flip",player_state_flip);

// Set default state
state_init("Idle");

#endregion