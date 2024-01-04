/// @desc Init
event_inherited();

// Setup state machine
state_machine_init();

// Define states
state_create("Wander",zombie_ai_state_wander);
state_create("Rush",zombie_ai_state_rush);
state_create("Combat",zombie_ai_state_combat);

// Set default state
state_init("Wander");