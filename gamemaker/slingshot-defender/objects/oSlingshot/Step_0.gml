/// @desc Update

// If touching sling shot
if (mouse_check_button_pressed(mb_left) && (
	mouse_x >= bbox_left && mouse_x <= bbox_right &&
	mouse_y >= bbox_top && mouse_y <= bbox_bottom))
{
	// Sling drawn
	slingDrawn = true;
}

// If sling drawn and releasing touch
if (slingDrawn && mouse_check_button_released(mb_left))
{
	// Calculate mouse displacement vector
	var _mouseDisplacement = new Vector2(x - mouse_x,y - mouse_y);
	var _mouseDistance = _mouseDisplacement.getLength();
	
	// Clamp displacement length
	if (_mouseDistance > 64)
	{
		var _angle = _mouseDisplacement.getAngleDeg();
		_mouseDisplacement.x = lengthdir_x(64,_angle);
		_mouseDisplacement.y = lengthdir_y(64,_angle);
	}
	
	// Calculate shot strength
	var _shotStrength = clamp(_mouseDistance / 64,0,1);
	
	// Normalize mouse displacement
	_mouseDisplacement.normalize();
	
	// Emit projectile
	var _projectile = instance_create_layer(x,y,"Instances",equippedProjectile);
	with (_projectile)
	{
		// Calculate projectile velocity
		velocity.x = _mouseDisplacement.x * _shotStrength * maxLaunchSpeed;
		velocity.y = _mouseDisplacement.y * _shotStrength * maxLaunchSpeed;
	}
	
	// Sling released
	slingDrawn = false;
	delete _mouseDisplacement;
}