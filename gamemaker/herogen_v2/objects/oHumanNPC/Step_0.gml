/// @desc Event

// Inherit the parent event
event_inherited();

// Increment timers
goal_timer++;
life_timer++;
target_timer++;

// Check if at max goal timer
if (goal_timer >= max_goal_timer)
{
	// Check if rock nearby
	var _inst = collision_rectangle(x-detection_radius,y-detection_radius,x+detection_radius,y+detection_radius,oRock,false,false);
	if (_inst != noone)
	{
		// Choose rock as goal
		goal_x = _inst.x;
		goal_y = _inst.y;
	}
	else
	{
		// Choose new goal
		goal_x = x + irandom_range(-goal_radius,goal_radius);
		goal_y = y + irandom_range(-goal_radius,goal_radius);
	}
	
	// Reset goal timer
	goal_timer = 0;
	max_goal_timer = irandom_range(3,5) * 60;
}

// Check if at max life timer
if (life_timer >= max_life_timer)
{
	// Check distance to camera center
	if (get_manhattan_distance(x,y,oCamera.x,oCamera.y) > despawn_dist)
	{
		// Destroy human
		instance_destroy();
	}
	else
	{
		// Reset timer
		life_timer = 0;
	}
}

// Check actor timer
if (target_timer >= max_target_timer)
{
	// Update target
	target = collision_rectangle(x-detection_radius,y-detection_radius,x+detection_radius,y+detection_radius,oActor,false,true);
}