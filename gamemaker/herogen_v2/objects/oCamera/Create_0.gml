/// @desc Init

// Camera
camera_width = 640;
camera_height = 360;
camera_x = x - camera_width * 0.5;
camera_y = y - camera_height * 0.5;
cameraspd = oHuman.movespd;
pan_xborder = 64;
pan_yborder = 36;
target = oHero;

// States
hero_exists = true;

// GUI
version = global.version;
hero_color = oHero.body_color;