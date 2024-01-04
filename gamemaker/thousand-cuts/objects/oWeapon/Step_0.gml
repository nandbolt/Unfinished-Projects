/// @desc Update

// Inherit the parent event
event_inherited();

// Check shield collision
if (place_meeting(x,y,oShield))
{
	// Retract
	sprite_index = spriteRetract;
}
else
{
	// If weapon extended
	if (sprite_index == spriteMain)
	{
		// Get currently hit instances
		var _currHitList = ds_list_create();
		var _hits = instance_place_list(x,y,oDamageable,_currHitList,false);
	
		// If hitlist is not empty
		if (!ds_list_empty(hitList))
		{
			// Loop through hitlist
			var _size = ds_list_size(hitList);
			for (var _i = _size - 1; _i >= 0; _i--)
			{
				// Init bool
				var _stillHit = false;
			
				// If hit someone
				if (_hits > 0)
				{
					// Get previously hit instance
					var _pid = hitList[| _i];
				
					// Loop through current hit list
					for (var _j = 0; _j < _hits; _j++)
					{
						// Get currently hit instance
						var _cid = _currHitList[| _j];
				
						// If ID's match
						if (_cid == _pid)
						{
							// Still hit
							_stillHit = true;
					
							// Break loop
							break;
						}
					}
				}
			
				// Check if not still hit
				if (!_stillHit)
				{
					// Remove from hitlist
					ds_list_delete(hitList,_i)
				}
			}
		}
	
		// If hit someone
		if (_hits > 0)
		{
			for (var _i = 0; _i < _hits; _i++)
			{
				var _id = _currHitList[| _i];
				if (ds_list_find_index(hitList,_id) == -1 && _id != owner.id)
				{
					// Attack
					weaponAttack(_id);
				}
			}
		}
	}
}