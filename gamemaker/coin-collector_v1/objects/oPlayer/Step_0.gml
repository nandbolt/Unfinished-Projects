/// @desc Logic

// Check inputs
var _key_left = keyboard_check(ord("A")) || (gamepad_axis_value(0,gp_axislh) < 0);
var _key_right = keyboard_check(ord("D")) || (gamepad_axis_value(0,gp_axislh) > 0);
var _key_jump_pressed = keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0,gp_face1);
var _key_jump_released = keyboard_check_released(vk_space) || gamepad_button_check_released(0,gp_face1);

// Calculate states
on_ground = place_meeting(x,y+1,oCollider);
on_wall = place_meeting(x+1,y,oCollider) || place_meeting(x-1,y,oCollider);

// Update x scale
if ((_key_right - _key_left) != 0 && !on_wall && state != PlayerState.WALLPUSH)
{
	image_xscale = _key_right - _key_left;
}

// States
switch (state)
{
	case PlayerState.IDLE:
		// Calculate move direction
		move_dir = _key_right - _key_left;
		
		if (move_dir != 0)
		{
			// IDLE -> RUN
			state = PlayerState.RUN;
			sprite_index = sPlayerCollectorRun;
		}
		else if (_key_jump_pressed)
		{
			// IDLE -> JUMP
			state = PlayerState.JUMP;
			sprite_index = sPlayerCollectorJump;
			audio_play_sound(sfxJump,1,false);
			
			// Apply jump force
			y_spd = -jump_force;
		}
		else if (!on_ground)
		{
			// IDLE -> FALL
			state = PlayerState.FALL;
			sprite_index = sPlayerCollectorFall;
		}
		break;
	case PlayerState.RUN:
		// Calculate move direction
		move_dir = _key_right - _key_left;
		
		// Calculate x speed
		var _x_spd_wanted = move_dir * run_spd;
		x_spd += (_x_spd_wanted - x_spd) * run_accel;
		
		if (move_dir == 0 && round(x_spd) == 0)
		{
			// RUN -> IDLE
			state = PlayerState.IDLE;
			sprite_index = sPlayerCollectorIdle;
		}
		else if (_key_jump_pressed)
		{
			// RUN -> JUMP
			state = PlayerState.JUMP;
			sprite_index = sPlayerCollectorJump;
			audio_play_sound(sfxJump,1,false);
			
			// Apply jump force
			y_spd = -jump_force;
		}
		else if (!on_ground)
		{
			if (on_wall)
			{
				// RUN -> WALLCLING
				state = PlayerState.WALLCLING;
				sprite_index = sPlayerCollectorWallcling;
			}
			else
			{
				// RUN -> FALL
				state = PlayerState.FALL;
				sprite_index = sPlayerCollectorFall;
			}
		}
		break;
	case PlayerState.JUMP:
		// Calculate move direction
		move_dir = _key_right - _key_left;
		
		// Calculate x speed
		var _x_spd_wanted = move_dir * run_spd;
		x_spd += (_x_spd_wanted - x_spd) * air_accel;
		
		if (y_spd < max_y_spd)
		{
			// Gravity
			y_spd += grav;
		}
		if (_key_jump_released)
		{
			// Stop jump
			y_spd = 0;
		}
		if (y_spd >= 0)
		{
			// JUMP -> FALL
			state = PlayerState.FALL;
			sprite_index = sPlayerCollectorFall;
		}
		else if (on_wall)
		{
			// JUMP -> WALLCLING
			state = PlayerState.WALLCLING;
			sprite_index = sPlayerCollectorWallcling;
			var _dir = 1;
			if (place_meeting(x-1,y,oCollider))
			{
				_dir = -1;
			}
			image_xscale = _dir;
			audio_play_sound(sfxWallTouch,1,false);
		}
		break;
	case PlayerState.FALL:
		// Calculate move direction
		move_dir = _key_right - _key_left;
		
		// Calculate x speed
		var _x_spd_wanted = move_dir * run_spd;
		x_spd += (_x_spd_wanted - x_spd) * air_accel;
		
		if (y_spd < max_y_spd)
		{
			// Gravity
			y_spd += grav;
		}
		if (on_ground)
		{
			if (round(x_spd) == 0)
			{
				// FALL -> IDLE
				state = PlayerState.IDLE;
				sprite_index = sPlayerCollectorIdle;
				audio_play_sound(sfxLand,1,false);
			}
			else
			{
				// FALL -> RUN
				state = PlayerState.RUN;
				sprite_index = sPlayerCollectorRun;
				audio_play_sound(sfxLand,1,false);
			}
		}
		else if (on_wall)
		{
			// FALL -> WALLCLING
			state = PlayerState.WALLCLING;
			sprite_index = sPlayerCollectorWallcling;
			var _dir = 1;
			if (place_meeting(x-1,y,oCollider))
			{
				_dir = -1;
			}
			image_xscale = _dir;
			audio_play_sound(sfxWallTouch,1,false);
		}
		else if (oGame.coins > 0 && _key_jump_pressed)
		{
			// FALL -> JUMP
			state = PlayerState.JUMP;
			sprite_index = sPlayerCollectorJump;
			audio_play_sound(sfxJump,1,false);
			
			// Coin jump
			y_spd = -jump_force;
			oGame.coins--;
			
			// Spawn coin
			instance_create_layer(x,y+(sprite_height/2)+(sprite_get_height(sCoinIdle)/2),"Instances",oCoinBouncer);
		}
		break;
	case PlayerState.WALLCLING:
		if (y_spd < max_y_spd)
		{
			// Gravity
			y_spd += wall_grav;
		}
		if (on_ground)
		{
			// WALLCLING -> IDLE
			state = PlayerState.IDLE;
			sprite_index = sPlayerCollectorIdle;
			audio_play_sound(sfxLand,1,false);
		}
		else if (!on_wall)
		{
			if (y_spd >= 0)
			{
				// WALLCLING -> FALL
				state = PlayerState.FALL;
				sprite_index = sPlayerCollectorFall;
			}
			else
			{
				// WALLCLING -> JUMP
				state = PlayerState.JUMP;
				sprite_index = sPlayerCollectorJump;
			}
		}
		else if (_key_jump_pressed)
		{
			// Apply x force
			var _dir = -1;
			var _force = wall_jump_x_force;
			if (place_meeting(x-1,y,oCollider))
			{
				_dir = 1;
			}
			if ((_key_left && place_meeting(x+1,y,oCollider)) || (_key_right && place_meeting(x-1,y,oCollider)))
			{
				// WALLCLING -> WALLPUSH
				state = PlayerState.WALLPUSH;
				sprite_index = sPlayerCollectorWallpush;
				image_xscale = _dir;
				audio_play_sound(sfxWallPush,1,false);
				
				// Apply jump force
				y_spd = 0;
				
				// Apply push force
				_force = wall_push_force;
				
				// Set alarm
				alarm[0] = wall_push_time * game_get_speed(gamespeed_fps);
			}
			else
			{
				// WALLCLING -> JUMP
				state = PlayerState.JUMP;
				sprite_index = sPlayerCollectorJump;
				image_xscale = _dir;
				audio_play_sound(sfxJump,1,false);
				
				// Apply jump force
				y_spd = -wall_jump_y_force;
				
				// Apply move direction
				move_dir = _dir;
			}
			x_spd = _force * _dir;
		}
		break;
	case PlayerState.WALLPUSH:
		if (alarm[0] == -1)
		{
			// WALLPUSH -> FALL
			state = PlayerState.FALL;
			sprite_index = sPlayerCollectorFall;
		}
		else if (_key_jump_released)
		{
			// WALLPUSH -> JUMP
			state = PlayerState.JUMP;
			sprite_index = sPlayerCollectorJump;
			audio_play_sound(sfxJump,1,false);
			
			// Apply jump force
			y_spd = -wall_cancel_force;
		}
		break;
}

// Round speed
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

// Update y position
y += _y_spd;