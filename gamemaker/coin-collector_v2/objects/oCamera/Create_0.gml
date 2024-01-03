/// @desc Init

// States
active = false;

// Dimensions
width = 640;
height = 360;

// Setup
camera = camera_create();
var _vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
var _pm = matrix_build_projection_ortho(width,height,1,10000);
camera_set_view_mat(camera,_vm);
camera_set_proj_mat(camera,_pm);

// Follow
followed_obj = oPlayer;
x_to = x;
y_to = y;