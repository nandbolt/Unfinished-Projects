/// @desc Switch Cameras
view_camera[0] = other.camera;
other.active = true;
oCameraPlayer.active = false;

// Move background
layer_x("Background",other.x-320);
layer_y("Background",other.y-180);