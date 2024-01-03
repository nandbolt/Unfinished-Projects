/// @desc Core Logic

// Gravity
if (y_spd < max_y_spd)
{
	y_spd += grav;
}

// Round speed
var _x_spd = round(x_spd);
var _y_spd = round(y_spd);

// X collision
if (place_meeting(x+_x_spd,y,oCollider))
{
	_x_spd = -_x_spd;
	x_spd = -x_spd;
}

// Update x position
x += _x_spd;

// Y collision
if (place_meeting(x,y+_y_spd,oCollider))
{
	if (bounces > 0)
	{
		_y_spd = -round(_y_spd);
		y_spd = -y_spd;
		bounces--;
	}
	else
	{
		instance_destroy();
	}
}

// Update y position
y += _y_spd;