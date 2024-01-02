/// @desc Spawn Timer

var _x,_y;

// Check if less than max entity count
if (rock_cnt < max_rock_cnt)
{	
	// Calculate X/Y spawns
	_x = irandom_range(oCamera.x - oCamera.camera_width,oCamera.x + oCamera.camera_width);
	if (_x > oCamera.x - oCamera.camera_width * 0.5 && _x < oCamera.x + oCamera.camera_width * 0.5)
	{
		if (irandom(1) == 0)
		{
			// Bottom side
			_y = irandom_range(oCamera.y + oCamera.camera_height * 0.5,oCamera.y + oCamera.camera_height);
		}
		else
		{
			// Top side
			_y = irandom_range(oCamera.y - oCamera.camera_height * 0.5,oCamera.y - oCamera.camera_height);
		}
	}
	else
	{
		// Left/right sides
		_y = irandom_range(oCamera.y - oCamera.camera_height,oCamera.y + oCamera.camera_height);
	}
	
	// Clamp to boundaries
	if (_x < 0)
	{
		_x = oCamera.camera_width * 0.5 - _x;
	}
	if (_x > room_width)
	{
		_x = room_width - oCamera.camera_width * 0.5 - _x
	}
	if (_y < 0)
	{
		_y = oCamera.camera_height * 0.5 - _y;
	}
	if (_y > room_height)
	{
		_y = room_height - oCamera.camera_height * 0.5 - _y;
	}
	
	// Spawn entity
	instance_create_layer(_x,_y,"Instances",oRock);
	
	// Increment entity count
	rock_cnt++;
}
// Check actors
if (actor_cnt < max_actor_cnt)
{
	// Calculate X/Y spawns
	_x = irandom_range(oCamera.x - oCamera.camera_width,oCamera.x + oCamera.camera_width);
	if (_x > oCamera.x - oCamera.camera_width * 0.5 && _x < oCamera.x + oCamera.camera_width * 0.5)
	{
		if (irandom(1) == 0)
		{
			// Bottom side
			_y = irandom_range(oCamera.y + oCamera.camera_height * 0.5,oCamera.y + oCamera.camera_height);
		}
		else
		{
			// Top side
			_y = irandom_range(oCamera.y - oCamera.camera_height * 0.5,oCamera.y - oCamera.camera_height);
		}
	}
	else
	{
		// Left/right sides
		_y = irandom_range(oCamera.y - oCamera.camera_height,oCamera.y + oCamera.camera_height);
	}
	
	// Clamp to boundaries
	if (_x < 0)
	{
		_x = oCamera.camera_width * 0.5 - _x;
	}
	if (_x > room_width)
	{
		_x = room_width - oCamera.camera_width * 0.5 - _x
	}
	if (_y < 0)
	{
		_y = oCamera.camera_height * 0.5 - _y;
	}
	if (_y > room_height)
	{
		_y = room_height - oCamera.camera_height * 0.5 - _y;
	}
	
	// Spawn entity
	instance_create_layer(_x,_y,"Instances",oHumanNPC);
	
	// Increment actor count
	actor_cnt++;
}

// Fish chance
_x = irandom_range(oCamera.x - oCamera.camera_width * 0.5,oCamera.x + oCamera.camera_width * 0.5);
_y = irandom_range(oCamera.y - oCamera.camera_height * 0.5,oCamera.y + oCamera.camera_height * 0.5);
if (tilemap_get_at_pixel(collision_tiles,_x,_y) == 2)
{
	instance_create_layer(_x,_y,"Instances",oFish);
}

// Restart timer
alarm[0] = spawn_freq;