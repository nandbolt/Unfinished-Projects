/// @desc Attack Timer

// Flip holding tool
holdingTool = !holdingTool;

// Check if holding tool
if (holdingTool)
{
	// Get attack x/y origin
	var _x = x + lengthdir_x(weaponDistance,image_angle), _y = y + lengthdir_y(weaponDistance,image_angle);
	
	// Create weapon
	heldTool = instance_create_layer(_x,_y,"Instances",oSword);
	with (heldTool)
	{
		image_angle = other.image_angle;
		owner = other;
		distanceFromOwner = other.weaponDistance;
	}
}
else
{
	// Retract tool
	with (heldTool)
	{
		retractTool = true;
	}
	heldTool = noone;
}

// Reset timer
alarm[0] = attackTime;