/// @desc Event

// Inherit the parent event
event_inherited();

// Brain
goal_x = x;
goal_y = y;
goal_timer = 0;
max_goal_timer = irandom_range(3,5) * 60;
update_inputs = human_update_inputs;
target = noone;
target_timer = 0;
max_target_timer = 60;
throw_timer = 0;
max_throw_timer = 30;
goal_radius = 128;
detection_radius = 64;

// Lifetime
life_timer = 0;
max_life_timer = 600;
despawn_dist = 600;