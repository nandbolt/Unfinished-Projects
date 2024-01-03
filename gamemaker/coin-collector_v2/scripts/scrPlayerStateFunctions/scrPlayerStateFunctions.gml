/// @func	player_state_idle();
/// @desc	Player idle state.

function player_state_idle()
{
	// Check if switching to state
	if (state_new)
	{
		// Set movement info
		x_spd = 0;
		y_spd = 0;
		
		// Set sprite info
		sprite_index = sCoinCollectorIdle;
	}
	
	// Check if not grounded
	if (!place_meeting(x,y+1,oCollider))
	{
		// IDLE -> FALL
		state_switch("Fall");
	}
	else
	{
		// Check inputs
		var _key_right = check_input(Input.RIGHT);
		var _key_left = check_input(Input.LEFT);
		var _key_jump_pressed = check_input(Input.JUMP_PRESSED);
		var _move_dir = _key_right - _key_left;
		
		// Check if inputting move direction
		if (_move_dir != 0)
		{
			// IDLE -> RUN
			state_switch("Run");
		}
		// Check if inputting jump
		else if (_key_jump_pressed)
		{
			// IDLE -> JUMP
			state_switch("Jump");
			
			// Apply jump force
			y_spd = -jump_force;
			
			#region Debris particles
		
			// Loop 3 times
			repeat (3)
			{
				// Setup particle info
				var _sprite_half_width = sprite_width/2;
				var _x = x+irandom_range(-_sprite_half_width,_sprite_half_width), _y = y+(sprite_height/2)-4;
		
				with (oParticles)
				{
					// Emit debris particles
					part_particles_create_color(part_system,_x,_y,part_type_debris,c_gray,1);
				}
			}
		
			#endregion
		}
	}
}


/// @func	player_state_run();
/// @desc	Player run state.

function player_state_run()
{
	// Check if switching to state
	if (state_new)
	{
		// Set sprite index
		sprite_index = sCoinCollectorRun;
		state_var[0] = 0;
	}
	
	// Check inputs
	var _key_right = check_input(Input.RIGHT);
	var _key_left = check_input(Input.LEFT);
	var _key_jump_pressed = check_input(Input.JUMP_PRESSED);
	var _move_dir = _key_right - _key_left;
	
	// Set image x scale
	if (_move_dir != 0)
	{
		image_xscale = _move_dir;
	}
	
	// Check if image index is footstep
	if (floor(image_index) == 1)
	{
		if (state_var[0] != 1)
		{
			// Footstep sfx
			audio_play_sound(sfxFootstep,1,false);
			state_var[0] = 1;
			
			#region Debris particles
			
			// Loop 3 times
			repeat (1)
			{
				// Setup particle info
				var _sprite_half_width = sprite_width/2;
				var _x = x+irandom_range(-_sprite_half_width,_sprite_half_width), _y = y+(sprite_height/2)-4;
		
				with (oParticles)
				{
					// Emit debris particles
					part_particles_create_color(part_system,_x,_y,part_type_debris,c_gray,1);
				}
			}
		
			#endregion
		}
	}
	else
	{
		state_var[0] = 0;
	}
	
	// Calculate speed
	calculate_x_speed(_move_dir,run_accel,max_run_spd);
	
	// Check if not grounded
	if (!place_meeting(x,y+1,oCollider))
	{
		// RUN -> FALL
		state_switch("Fall");
	}
	else
	{
		// Check if no input and 0 x speed
		if (_move_dir == 0 && round(x_spd) == 0)
		{
			// RUN -> IDLE
			state_switch("Idle");
		}
		else if (_key_jump_pressed)
		{
			// RUN -> JUMP
			state_switch("Jump");
		
			// Apply jump force
			y_spd = -jump_force;
			
			#region Debris particles
		
			// Loop 3 times
			repeat (3)
			{
				// Setup particle info
				var _sprite_half_width = sprite_width/2;
				var _x = x+irandom_range(-_sprite_half_width,_sprite_half_width), _y = y+(sprite_height/2)-4;
		
				with (oParticles)
				{
					// Emit debris particles
					part_particles_create_color(part_system,_x,_y,part_type_debris,c_gray,1);
				}
			}
		
			#endregion
		}
	}
}


/// @func	player_state_jump();
/// @desc	Player jump state.

function player_state_jump()
{
	// Check if switching to state
	if (state_new)
	{
		// Check if previous state was wallcling
		if (sprite_index != sCoinCollectorWallrun)
		{
			// Jump sfx
			audio_play_sound(sfxJump,1,false);
		}
		
		// Set sprite index
		sprite_index = sCoinCollectorJump;
		
		// Set image x scale
		if (sign(x_spd) != 0)
		{
			image_xscale = sign(x_spd);
		}
	}
	
	// Check inputs
	var _key_right = check_input(Input.RIGHT);
	var _key_left = check_input(Input.LEFT);
	var _key_jump_released = check_input(Input.JUMP_RELEASED);
	var _move_dir = _key_right - _key_left;
	
	// Set image x scale
	if (_move_dir != 0)
	{
		image_xscale = _move_dir;
	}
	
	// Calculate air speed
	calculate_air_x_speed(_move_dir,air_accel,max_run_spd,0);
	apply_gravity(grav,max_fall_spd);
	
	// Check if jump key released
	if (_key_jump_released)
	{
		// Zero y speed
		y_spd = 0;
	}
	// Check if on wall
	if (place_meeting(x+1,y,oCollider) || place_meeting(x-1,y,oCollider))
	{
		// JUMP -> WALLCLING
		state_switch("Wallcling");
	}
	// Check if y speed is greater than or 0
	else if (y_spd >= 0)
	{
		// JUMP -> FALL
		state_switch("Fall");
	}
}


/// @func	player_state_fall();
/// @desc	Player fall state.

function player_state_fall()
{
	// Check if switching to state
	if (state_new)
	{
		// Set sprite info
		sprite_index = sCoinCollectorFlip;
	}
	
	// Check inputs
	var _key_right = check_input(Input.RIGHT);
	var _key_left = check_input(Input.LEFT);
	var _key_down = check_input(Input.DOWN);
	var _key_jump_pressed = check_input(Input.JUMP_PRESSED);
	var _move_dir = _key_right - _key_left;
	
	// Set image x scale
	if (_move_dir != 0)
	{
		image_xscale = _move_dir;
	}
	
	// Calculate air speed
	calculate_air_x_speed(_move_dir,air_accel,max_run_spd,_key_down);
	apply_gravity(grav,max_fall_spd);
	
	// Check if jumped and close enough to floor
	if (_key_jump_pressed && place_meeting(x,y+9,oCollider))
	{
		// FALL -> FLIP
		state_switch("Flip");
		
		// Apply jump force
		y_spd = -jump_force/2;
			
		#region Debris particles
		
		// Loop 3 times
		repeat (3)
		{
			// Setup particle info
			var _sprite_half_width = sprite_width/2;
			var _x = x+irandom_range(-_sprite_half_width,_sprite_half_width), _y = y+(sprite_height/2)-4;
		
			with (oParticles)
			{
				// Emit debris particles
				part_particles_create_color(part_system,_x,_y,part_type_debris,c_gray,1);
			}
		}
		
		#endregion
	}
	// Check if on ground
	else if (place_meeting(x,y+1,oCollider))
	{
		// Check if x speed is about 0
		if (round(x_spd) == 0)
		{
			// FALL -> IDLE
			state_switch("Idle");
		}
		else
		{
			// FALL -> RUN
			state_switch("Run");
		}
		
		// Land sfx
		audio_play_sound(sfxLand,1,false);
		
		#region Debris particles
		
		// Loop 3 times
		repeat (3)
		{
			// Setup particle info
			var _sprite_half_width = sprite_width/2;
			var _x = x+irandom_range(-_sprite_half_width,_sprite_half_width), _y = y+(sprite_height/2)-4;
		
			with (oParticles)
			{
				// Emit airburst particles
				part_particles_create_color(part_system,_x,_y,part_type_debris,c_gray,1);
			}
		}
		
		#endregion
	}
	// Check if on wall
	else if (place_meeting(x+1,y,oCollider) || place_meeting(x-1,y,oCollider))
	{
		// FALL -> WALLCLING
		state_switch("Wallcling");
	}
}


/// @func	player_state_wallcling();
/// @desc	Player wallcling state.

function player_state_wallcling()
{
	// Check if switching to state
	if (state_new)
	{
		// Check if y speed is less than 0
		if (y_spd >= 0)
		{
			// Set sprite index
			sprite_index = sCoinCollectorWallcling;
		}
		else
		{
			// Set sprite index
			sprite_index = sCoinCollectorWallrun;
		}
		
		// Set image x scale
		if (place_meeting(x+1,y,oCollider))
		{
			// Right wall
			image_xscale = 1;
		}
		else
		{
			// Left wall
			image_xscale = -1;
		}
		
		// Wallcling sfx
		audio_play_sound(sfxWallcling,1,true);
	}
	
	// Check inputs
	var _key_right = check_input(Input.RIGHT);
	var _key_left = check_input(Input.LEFT);
	var _key_jump_pressed = check_input(Input.JUMP_PRESSED);
	
	// Calculate speed
	apply_gravity(wall_grav,max_wall_fall_spd);
	
	// Check if on ground
	if (place_meeting(x,y+1,oCollider))
	{
		// WALLCLING -> IDLE
		state_switch("Idle");
		
		// Stop wallcling sfx
		audio_stop_sound(sfxWallcling);
	}
	// Check if on wall
	else if (!place_meeting(x+image_xscale,y,oCollider))
	{
		// Check y speed
		if (y_spd < 0)
		{
			// WALLCLING -> JUMP
			state_switch("Jump");
		}
		else
		{
			// WALLCLING -> FALL
			state_switch("Fall");
		}
		
		// Stop wallcling sfx
		audio_stop_sound(sfxWallcling);
	}
	else if (_key_jump_pressed)
	{
		// Check if inputting direction opposite of wall
		if ((_key_left && image_xscale > 0) || (_key_right && image_xscale < 0))
		{
			// WALLCLING -> DASH
			state_switch("Dash");
			
			// Apply dash forces
			y_spd = -dash_y_force;
			x_spd = dash_x_force * -image_xscale;
		}
		else
		{
			// WALLCLING -> JUMP
			state_switch("Jump");
			
			// Apply wall jump forces
			y_spd = -walljump_y_force;
			x_spd = walljump_x_force * -image_xscale;
			
			if (sprite_index == sCoinCollectorWallrun)
			{
				// Jump sfx
				audio_play_sound(sfxJump,1,false);
			}
		}
		
		// Stop wallcling sfx
		audio_stop_sound(sfxWallcling);
	}
	
	if (state_timer mod 10 == 0)
	{
		// Setup particle info
		var _sprite_half_height = sprite_height/2;
		var _x = x+(sprite_width/2), _y = y + irandom_range(-_sprite_half_height,_sprite_half_height);
		
		with (oParticles)
		{
			// Emit debris particles
			part_particles_create_color(part_system,_x,_y,part_type_debris,c_maroon,1);
		}
	}
	
	// Check if y speed is less than 0
	if (y_spd >= 0 && sprite_index != sCoinCollectorWallcling)
	{
		// Set sprite index
		sprite_index = sCoinCollectorWallcling;
	}
}


/// @func	player_state_dash();
/// @desc	Player dash state.

function player_state_dash()
{
	// Check if switching to state
	if (state_new)
	{
		// Check if previous state is flip
		if (sprite_index == sCoinCollectorFlip)
		{
			// Set sprite info
			sprite_index = sCoinCollectorDash;
			image_xscale = image_xscale;
			
			// Dash sfx
			audio_play_sound(sfxDash,1,false);
			
			#region Airburst Particles
		
			with (oParticles)
			{
				// Emit airburst particles
				part_particles_create(part_system,other.x,other.y,part_type_airburst,1);
			}
		
			#endregion
			
			// Flip dash
			state_var[0] = 1;
		}
		else
		{
			// Set sprite info
			sprite_index = sCoinCollectorDash;
			image_xscale = -image_xscale;
		
			// Dash sfx
			audio_play_sound(sfxDash,1,false);
		
			#region Debris Particles
		
			// Setup particle info
			var _sprite_half_height = sprite_height/2;
		
			// Loop 6 times
			repeat (6)
			{
				var _x = x-(sprite_width/2), _y = y + irandom_range(-_sprite_half_height,_sprite_half_height);
		
				with (oParticles)
				{
					// Emit debris particles
					part_particles_create_color(part_system,_x,_y,part_type_debris,c_maroon,1);
				}
			}
		
			#endregion
			
			// Wall dash
			state_var[0] = 0;
		}
	}
	
	// Check inputs
	var _key_jump_released = check_input(Input.JUMP_RELEASED);
	
	// Check if dash duration is finished
	if ((state_timer >= dash_duration && state_var[0] == 0) || (state_timer >= dash_duration/2 && state_var[0] == 1))
	{
		// DASH -> FALL
		state_switch("Fall");
	}
	// Check if touching wall
	else if (place_meeting(x+1,y,oCollider) || place_meeting(x-1,y,oCollider))
	{
		// DASH -> WALLCLING
		state_switch("Wallcling");
	}
	// Check if jump key released
	else if (_key_jump_released && state_var[0] == 0)
	{
		// DASH -> JUMP
		state_switch("Jump");
		
		// Apply dash cancel y force
		y_spd = -dash_cancel_y_force;
		
		#region Airburst Particles
		
		with (oParticles)
		{
			// Emit airburst particles
			part_particles_create(part_system,other.x,other.y,part_type_airburst,1);
		}
		
		#endregion
	}
}


/// @func	player_state_flip();
/// @desc	Player flip state.

function player_state_flip()
{
	// Check if switching to state
	if (state_new)
	{
		sprite_index = sCoinCollectorFlip;
		
		// Flip sfx
		audio_play_sound(sfxJump,1,false);
	}
	
	// Check inputs
	var _key_right = check_input(Input.RIGHT);
	var _key_left = check_input(Input.LEFT);
	var _key_jump_released = check_input(Input.JUMP_RELEASED);
	var _move_dir = _key_right - _key_left;
	
	// Set image x scale
	if (_move_dir != 0)
	{
		image_xscale = _move_dir;
	}
	
	// Calculate air speed
	calculate_air_x_speed(_move_dir,air_accel,max_run_spd,0);
	apply_gravity(grav,max_fall_spd);
	
	// Check if on ground
	if (place_meeting(x,y+1,oCollider))
	{
		// Check if x speed is about 0
		if (round(x_spd) == 0)
		{
			// FLIP -> IDLE
			state_switch("Idle");
		}
		else
		{
			// FLIP -> RUN
			state_switch("Run");
		}
		
		// Land sfx
		audio_play_sound(sfxLand,1,false);
		
		#region Debris particles
		
		// Loop 3 times
		repeat (3)
		{
			// Setup particle info
			var _sprite_half_width = sprite_width/2;
			var _x = x+irandom_range(-_sprite_half_width,_sprite_half_width), _y = y+(sprite_height/2)-4;
		
			with (oParticles)
			{
				// Emit airburst particles
				part_particles_create_color(part_system,_x,_y,part_type_debris,c_gray,1);
			}
		}
		
		#endregion
	}
	else if (_key_jump_released)
	{
		// FLIP -> DASH
		state_switch("Dash");
		
		// Apply dash forces
		//y_spd = -dash_y_force;
		y_spd = 0;
		if (sign(x_spd) != 0)
		{
			x_spd = dash_x_force * sign(x_spd);
		}
		else
		{
			x_spd = dash_x_force * image_xscale;
		}
	}
}