/// @desc Core Logic

#region Inputs

// Check move inputs
update_inputs();
var _xdir = input_right - input_left;
var _ydir = input_down - input_up;

// Check rotation inputs
rhand_x = x + sin(degtorad(rot+30)) * 4;
rhand_y = y + cos(degtorad(rot+30)) * 4;

#endregion

#region Actions

// Check if entering throw stance
if (action_throw_stance)
{
	// Check if trying to throw item
	if (action_use_item)
	{
		// Check held item count
		if (held_item_cnt > 0)
		{
			// Create object
			var _inst = instance_create_layer(rhand_x,rhand_y,"Instances",held_item_throwable);
			
			// Check projectile
			if (object_is_ancestor(held_item_throwable,oProjectile))
			{
				// Throw projectile
				var _rads = degtorad(rot);
				with (_inst)
				{
					owner = other.id;
					xspd = start_spd * cos(_rads);
					yspd = -start_spd * sin(_rads);
					rot = other.rot;
				}
			}
			else
			{
				// Drop item
				with (_inst)
				{
					rot = other.rot;
				}
			}
			
			// Decrement held item count
			held_item_cnt--;
		
			// Check if no more of held item
			if (held_item_cnt < 1)
			{
				held_item = noone;
				held_item_throwable = noone;
				held_item_spr = sEmpty;
				held_item_gui_spr = sHand;
			}
		}
	}
}
// Check if using item
else if (action_use_item)
{
	// Check if food
	if (object_is_ancestor(held_item,oFood))
	{
		// Eat food
		hunger_cnt = clamp(hunger_cnt--,0,max_hunger_cnt);
		alarm[0] = hunger_time;
		
		// Decrement held item count
		held_item_cnt--;
		
		// Check if no more of held item
		if (held_item_cnt < 1)
		{
			held_item = noone;
			held_item_throwable = noone;
			held_item_spr = sEmpty;
			held_item_gui_spr = sHand;
		}
	}
}

#endregion

// Check if moving diagonal
if (_xdir != 0 && _ydir != 0)
{
	// Apply diagonal speed
	xspd = _xdir * diagspd;
	yspd = _ydir * diagspd;
}
else
{
	// Apply normal speed
	xspd = _xdir * movespd;
	yspd = _ydir * movespd;
}

#region Animation

// Check animation switch
if (_xdir != 0 || _ydir != 0)
{
	if (action_throw_stance)
	{
		sprite_index = sHuman1RunStanceThrow;
	}
	else
	{
		sprite_index = sHuman1Run;
	}
}
else if (_xdir == 0 && _ydir == 0)
{
	if (action_throw_stance)
	{
		sprite_index = sHuman1IdleStanceThrow;
	}
	else
	{
		sprite_index = sHuman1Idle;
	}
}

#endregion

// Move and slide
move_and_collide_custom(Collision.SLIDE);