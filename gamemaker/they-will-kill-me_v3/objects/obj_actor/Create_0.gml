/// @desc Init
main_character = false;

// Movement
run_speed = 1;
jump_speed = 3;
grav = 0.2;
max_grav = 10;
x_speed = 0;
y_speed = 0;

// Health
max_hp = 100;
curr_hp = max_hp;

// Hunger
max_hunger = 100;
curr_hunger = 75;
hunger_rate = 60;	// 180
hunger_counter = 0;

// Directions
move_left = false;
move_right = false;
move_jump = false;

// Temp controls
key_left = vk_left;
key_right = vk_right;
key_jump = vk_up;

// Setup state machine
state_machine_init();

// Define states
state_create("Stand",actor_state_stand);
state_create("Run",actor_state_run);
state_create("Air",actor_state_air);

// Set default state
state_init("Stand");

// Setup pathfinding
agent_init(actor_find_move_actions,actor_build_move_actions,actor_follow_move_actions,actor_input);