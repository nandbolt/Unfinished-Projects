/// @desc Initialize

// Camera
camera_x = 0;
camera_y = 0;
camera_width = 1280;
camera_height = 720;

// Camera setup
view_enabled = true;
view_visible[0] = true;
camera_set_view_size(view_camera[0],camera_width,camera_height);

// Display
display_scale = 1;
display_width = camera_width * display_scale;
display_height = camera_height * display_scale;

// Window setup
window_set_size(display_width,display_height);
surface_resize(application_surface,display_width,display_height);

// GUI
display_set_gui_size(camera_width,camera_height);

alarm[0] = 1;	// Center window next frame