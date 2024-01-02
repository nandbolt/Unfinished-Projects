/// @func	move_and_collide_custom({int} collision,{int} collision_func);
/// @desc	Moves object and stops if a collision occurs.
function move_and_collide_custom(_collision,_collision_func = function(){})
{
	#region Floor speed
	
	// Floor speeds
	var _xspd = floor(xspd);
	var _yspd = floor(yspd);
	
	// Store remainder of speed (decimal)
	rxspd += xspd - _xspd;
	ryspd += yspd - _yspd;
	
	// Check remainder
	if (abs(rxspd) >= 1)
	{
		_xspd += floor(rxspd);
		rxspd -= floor(rxspd);
	}
	if (abs(ryspd) >= 1)
	{
		_yspd += floor(ryspd);
		ryspd -= floor(ryspd);
	}
	
	#endregion
	
	#region Handle collisions
	
	var _bboxside;
	
	#region Horizontal collision
	
	// Store current move direction
	if (_xspd > 0) _bboxside = bbox_right;
	else _bboxside = bbox_left;
	
	// Store tile index of left/right corner pixels
	var _p1 = tilemap_get_at_pixel(collision_map,_bboxside+_xspd,bbox_top);
	var _p2 = tilemap_get_at_pixel(collision_map,_bboxside+_xspd,bbox_bottom);
	
	// Check collision
	if (_p1 == 1 || _p2 == 1)
	{
		// Choose correct snapping direction
		if (_xspd > 0)
		{
			// Snap right
			x = x - (x mod TILE_SIZE) + (TILE_SIZE - 1) - (bbox_right - x);
		}
		else
		{
			// Snap left
			x = x - (x mod TILE_SIZE) - (bbox_left - x);
		}
		
		// Check collision type
		switch (_collision)
		{
			case Collision.SLIDE:
				// Reset x speed
				_xspd = 0;
				xspd = 0;
				rxspd = 0;
				break;
			case Collision.BOUNCE:
				// Reflect x speed
				_xspd = -_xspd;
				xspd = -xspd;
				rxspd = -rxspd;
				
				// Rotate
				rot = 180 - rot;
				break;
			case Collision.STOP:
				// Reset speeds
				_xspd = 0;
				xspd = 0;
				rxspd = 0;
				_yspd = 0;
				yspd = 0;
				ryspd = 0;
				break;
		}
		
		// Call collision function
		_collision_func();
	}
	
	#endregion
	
	#region Vertical collision
	
	// Store current move direction
	if (_yspd > 0)
	{
		_bboxside = bbox_bottom;
	}
	else
	{
		_bboxside = bbox_top;
	}
	
	// Store tile index of top/bottom corner pixels
	_p1 = tilemap_get_at_pixel(collision_map,bbox_left,_bboxside+_yspd);
	_p2 = tilemap_get_at_pixel(collision_map,bbox_right,_bboxside+_yspd);
	
	// Check collision
	if (_p1 == 1 || _p2 == 1)
	{
		// Choose correct snapping direction
		if (_yspd > 0)
		{
			// Snap bottom
			y = y - (y mod TILE_SIZE) + (TILE_SIZE - 1) - (bbox_bottom - y);
		}
		else
		{
			// Snap top
			y = y - (y mod TILE_SIZE) - (bbox_top - y);
		}
		
		// Check collision
		switch (_collision)
		{
			case Collision.SLIDE:
				// Reset y speed
				_yspd = 0;
				yspd = 0;
				ryspd = 0;
				break;
			case Collision.BOUNCE:
				// Reflect y speed
				_yspd = -_yspd;
				yspd = -yspd;
				ryspd = -ryspd;
				
				// Rotate
				rot = -rot;
				break;
			case Collision.STOP:
				// Reset speeds
				_xspd = 0;
				xspd = 0;
				rxspd = 0;
				_yspd = 0;
				yspd = 0;
				ryspd = 0;
				break;
		}
		
		// Call collision function
		_collision_func();
	}
	
	#endregion
	
	// Update/clamp position
	x = clamp(x + _xspd,0,room_width);
	y = clamp(y + _yspd,0,room_height);
	
	#endregion
}