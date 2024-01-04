/// @desc Initialize

// Camera variables
camera_width = 480;
camera_height = 270;

// Camera setup
camera = camera_create();
var _vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
var _pm = matrix_build_projection_ortho(camera_width,camera_height,1,10000);
camera_set_view_mat(camera,_vm);
camera_set_proj_mat(camera,_pm);
view_camera[0] = camera;

// Display
display_scale = 3;
display_width = camera_width * display_scale;
display_height = camera_height * display_scale;

// Window setup
window_set_size(display_width,display_height);
alarm[0] = 1;	// Center window next frame

// Camera drag
dragging = false;
drag_origin_x = 0;
drag_origin_y = 0;

// Camera follow
followed_obj = obj_human;
x_to = x;
y_to = y;

// Currency
max_currency = 100;
curr_currency = round(max_currency/2);
currency_counter = 0;

// Cost
zombie_cost = 10;

// HUD
camera_button_x = 8;
camera_button_y = 232;
camera_button_width = 32;
camera_button_height = 32;
can_spawn = 0;
spawn_button_x = 48;
spawn_button_y = 232;
spawn_button_width = 32;
spawn_button_height = 32;
paused = 0;
pause_button_x = 8;
pause_button_y = 8;
pause_button_width = 32;
pause_button_height = 32;

// Pause menu
resume_button_x = (camera_width/2)-32;
resume_button_y = (camera_height/2)-50;
resume_button_width = 64;
resume_button_height = 32;
restart_button_x = (camera_width/2)-32;
restart_button_y = (camera_height/2)-16;
restart_button_width = 64;
restart_button_height = 32;
quit_button_x = (camera_width/2)-32;
quit_button_y = (camera_height/2)+18;
quit_button_width = 64;
quit_button_height = 32;

// Control
controllable = false;

// Setup state machine
state_machine_init();

// Define states
state_create("Free",player_state_free);
state_create("Follow",player_state_follow);

// Set default state
state_init("Follow");