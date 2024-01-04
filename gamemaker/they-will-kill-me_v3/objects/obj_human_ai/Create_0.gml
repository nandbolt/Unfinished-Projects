/// @desc Init
event_inherited();

// Setup state machine
state_machine_init();

// Define states
state_create("Wander",human_ai_state_wander);
state_create("Rush",human_ai_state_rush);
state_create("Combat",human_ai_state_combat);

// Set default state
state_init("Wander");