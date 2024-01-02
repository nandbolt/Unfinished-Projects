/// @desc Camera Setup

// Enable views
view_enabled = true;
view_visible[0] = true;

camera_set_view_size(view_camera[0],camera_width,camera_height);

// Display
display_scale = 2;
display_width = camera_width * display_scale;
display_height = camera_height * display_scale;

window_set_size(display_width,display_height);
surface_resize(application_surface,display_width,display_height);

display_set_gui_size(camera_width,camera_height);

alarm[0] = 1;