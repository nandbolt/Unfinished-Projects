/// @function				actor_state_stand();
/// @description			Actor's standing state.

function actor_state_stand()
{
	// Check if switching to state
	if (state_new)
	{
		x_speed = 0;
		y_speed = 0;
		image_speed = 1;
		sprite_index = spr_actor_stand;
		image_index = 0;
	}
	
	// Check if moving left or right with no walls in the way
	if ((move_left && !place_meeting(x-1,y,obj_wall))||(move_right && !place_meeting(x+1,y,obj_wall)))
	{
		if (move_right - move_left != 0)
		{
			state_switch("Run");
		}
	}
	
	// Check if jumping
	if (move_jump)
	{
		state_switch("Air");
		y_speed = -jump_speed;
	}
	
	// Check if not grounded
	if (!place_meeting(x,y+1,obj_wall))
	{
		state_switch("Air");
	}
}


/// @function				actor_state_run();
/// @description			Actor's running state.

function actor_state_run()
{
	// Check if switching to state
	if (state_new)
	{
		image_speed = 1;
		sprite_index = spr_actor_run;
		image_index = 0;
	}
	
	// Calculate x speed wanted
	var x_speed_wanted = run_speed * (move_right - move_left);
	
	// Calculate theoretical x speed
	//x_speed += (x_speed_wanted - x_speed) * 0.1;	// Physics movement
	x_speed = x_speed_wanted;						// Arcadey movement
	
	// Calculate actual x speed by rounding
	var xsp = round(x_speed);	// Turn theoretical value into integer for collision and movement
	
	// Check if no horizontal speed
	if (xsp == 0)
	{
		state_switch("Stand");
	}
	else
	{
		image_xscale = sign(x_speed);
	}
	
	// Check if not grounded
	if (!place_meeting(x,y+1,obj_wall))
	{
		state_switch("Air");
	}
	
	// Check horizontal collision
	if (place_meeting(x+xsp,y,obj_wall))
	{
		while (!place_meeting(x+sign(xsp),y,obj_wall))
		{
			x += sign(xsp);
		}
		xsp = 0;
		x_speed = 0;	// We still have to set the theoretical value to 0 here
	}
	x += xsp;
	
	// Check if jumping
	if (move_jump)
	{
		state_switch("Air");
		y_speed = -jump_speed;
	}
}


/// @function				actor_state_air();
/// @description			Actor's air state.

function actor_state_air()
{
	// Check if switching to state
	if (state_new)
	{
		image_speed = 1;
		sprite_index = spr_actor_air;
		image_index = 0;
	}
	
	// Apply gravity
	if (y_speed >= max_grav)
	{
		y_speed = max_grav;
	}
	else
	{
		y_speed += grav;
	}
	
	// Calculate y speed
	var ysp = round(y_speed);	// Turn theoretical value into an integer for collision and movement
	
	// Vertical collision
	if (place_meeting(x,y+ysp,obj_wall))
	{
		while (!place_meeting(x,y+sign(ysp),obj_wall))
		{
			y += sign(ysp);
		}
		ysp = 0;
		y_speed = 0;	// We still have to set the theoretical value to 0 here
	}
	y += ysp;
	
	// Calculate x speed wanted
	var x_speed_wanted = run_speed * (move_right - move_left);
	
	// Calculate theoretical x speed
	//h_speed += (h_speed_wanted - h_speed) * 0.1;	// Physics movement
	x_speed = x_speed_wanted;						// Arcadey movement
	
	// Calculate actual x speed by rounding
	var xsp = round(x_speed);	// Turn theoretical value into integer for collision and movement
	
	// Check horizontal speed direction
	if (xsp != 0)
	{
		image_xscale = sign(x_speed);
	}
	
	// Check horizontal collision
	if (place_meeting(x+xsp,y,obj_wall))
	{
		while (!place_meeting(x+sign(xsp),y,obj_wall))
		{
			x += sign(xsp);
		}
		xsp = 0;
		x_speed = 0;	// We still have to set the theoretical value to 0 here
	}
	x += xsp;
	
	// Check for state switches
	if (place_meeting(x,y+1,obj_wall) && ysp == 0)
	{
		if (xsp == 0)
		{
			state_switch("Stand");
		}
		else
		{
			state_switch("Run");
		}
	}
}