/// @desc Init

// Spawning
spawn_x_offset = 192;	// Spawn x offset from room width
spawn_y_offset = 64;	// Spawn y offset from room height

// Collected
fade_duration = 0.75;	// Fade duration (sec)
fade_y_spd = 0.25;		// Y speed when fading

// Calculate fade speed
fade_spd = 1/(game_get_speed(gamespeed_fps) * fade_duration);

#region State Machine

// Setup state machine
state_machine_init();

// Define states
state_create("Inactive",collectable_state_inactive);
state_create("Active",collectable_state_active);
state_create("Collected",collectable_state_collected);

// Set default state
state_init("Inactive");

#endregion