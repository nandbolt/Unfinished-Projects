/// @func	move_and_collide_custom();
/// @desc	Calculates movement and collisions.

function move_and_collide_custom()
{
	// Round speed (actual speed)
	var _x_spd = round(x_spd);
	var _y_spd = round(y_spd);
	
	// X collision
	if (place_meeting(x+_x_spd,y,oCollider))
	{
		while (!place_meeting(x+sign(_x_spd),y,oCollider))
		{
			x += sign(_x_spd);
		}
		_x_spd = 0;
		x_spd = 0;
	}
	
	// Update x position
	x += _x_spd;
	
	// Y collision
	if (place_meeting(x,y+_y_spd,oCollider))
	{
		while (!place_meeting(x,y+sign(_y_spd),oCollider))
		{
			y += sign(_y_spd);
		}
		_y_spd = 0;
		y_spd = 0;
	}
	
	// Update y collision
	y += _y_spd;
}


/// @func						calculate_x_speed(move_dir,accel,max_x_spd);
/// @param	{real}	move_dir	X direction to move to (-1,0,1)
/// @param	{real}	accel		Acceleration of player
/// @param	{real}	max_x_spd	Max x speed
/// @desc						Calculates x speed for the player based on given inputs.

function calculate_x_speed(_move_dir,_accel,_max_x_spd)
{
	var _x_spd = _move_dir * _max_x_spd;
	x_spd += (_x_spd - x_spd) * _accel;
}


/// @func						calculate_air_x_speed(move_dir,accel,max_x_spd,brake);
/// @param	{real}	move_dir	X direction to move to (-1,0,1)
/// @param	{real}	accel		Acceleration of player
/// @param	{real}	max_x_spd	Max x speed
/// @param	{real}	brake		Brake
/// @desc						Calculates x speed in air for the player based on given inputs.

function calculate_air_x_speed(_move_dir,_accel,_max_x_spd,_brake)
{
	// Check if braking
	if (_brake)
	{
		calculate_x_speed(0,_accel,_max_x_spd);
	}
	// Check if inputting move direction
	else if (_move_dir != 0 || abs(x_spd) > abs(_max_x_spd))
	{
		calculate_x_speed(_move_dir,_accel,_max_x_spd);
	}
}


/// @func						apply_gravity(grav,max_y_spd);
/// @param	{real}	grav		The gravity of the player
/// @param	{real}	max_y_spd	The terminal velocity of player
/// @desc						Applies gravity to player.

function apply_gravity(_grav,_max_y_spd)
{
	if (y_spd < _max_y_spd)
	{
		// Gravity
		y_spd += _grav;
	}
	else
	{
		// Terminal velocity
		y_spd = _max_y_spd;
	}
}