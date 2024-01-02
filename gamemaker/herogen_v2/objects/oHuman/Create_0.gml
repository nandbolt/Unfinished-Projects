/// @desc Init

// Inherit the parent event
event_inherited();

// Movement
movespd = 2;
diagspd = sin(degtorad(45)) * movespd;

// Inventory
held_item = noone;
held_item_throwable = noone;
held_item_spr = sEmpty;
held_item_cnt = 0;
max_held_item_cnt = 5;
rhand_x = 0;
rhand_y = 8;

// Actions
update_inputs = function(){};
input_left = 0;
input_right = 0;
input_down = 0;
input_up = 0;
action_interact = 0;
action_use_item = 0;
action_throw_stance = 0;

// Animation
curr_anim_cnt = 0;
curr_anim_spd = 15;

// Hunger
hunger_time = 3600;
hunger_cnt = 0;
max_hunger_cnt = 5;

// Shader
uni_color = shader_get_uniform(shdColor,"u_color");
var _off = irandom_range(-150,75);
var _r = (251+_off)/255, _g = (175+_off)/255, _b = (93+_off)/255;
body_color = [_r,_g,_b];
_off = irandom_range(-125,150);
_r = (163+_off)/255;
_g = (93+_off)/255;
_b = (10+_off)/255;
hair_color = [_r,_g,_b];

// Start timers
alarm[0] = hunger_time;