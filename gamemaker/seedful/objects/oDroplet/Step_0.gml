/// @desc Core Logic

// Apply y velocity
if (yspd < max_yspd)
{
	yspd += grav;
}
var _yspd = round(yspd);	// Turn theoretical value into an integer for collision and movement
y += _yspd;

// Apply x velocity
var _xspd = round(xspd);	// Turn theoretical value into an integer for collision and movement
x += _xspd;

// Check if off screen
if (x < 0 || x > room_width || y < 0 || y > room_height)
{
	instance_destroy();
}