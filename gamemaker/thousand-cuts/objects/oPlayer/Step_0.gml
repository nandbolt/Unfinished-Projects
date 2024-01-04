/// @desc Update

// Update inputs
updatePlayerInputs();

// Locals
var _rotationSpeed = turnSpeed;

// If holding tool
if (holdingTool)
{
	// Update tool
	with (heldTool)
	{
		retractTool = !other.inputHoldTool;
	}
	
	// Holding tool
	_rotationSpeed *= (1 / heldTool.mass);
	maxSpeed = runSpeedMax * (1 / heldTool.mass);
	deacceleration = holdToolDeacceleration;
}
else
{
	// Free
	maxSpeed = runSpeedMax;
	deacceleration = runDeacceleration;
}

// Update angle
var _angleDeg = mouseAngleDegrees;
_angleDeg = frontAngleDegrees - angle_difference(frontAngleDegrees,_angleDeg);
frontAngleDegrees = lerp(frontAngleDegrees,_angleDeg,_rotationSpeed);

// Check attack
if (inputAttack && !holdingTool)
{
	// Get attack x/y origin
	var _x = x + lengthdir_x(weaponDistance,frontAngleDegrees), _y = y + lengthdir_y(weaponDistance,frontAngleDegrees);
	
	// Create weapon
	heldTool = instance_create_layer(_x,_y,"Instances",currentWeapon);
	with (heldTool)
	{
		image_angle = other.frontAngleDegrees;
		owner = other;
		distanceFromOwner = other.weaponDistance;
	}
	
	// Hold tool
	holdingTool = true;
	buttonHoldTool = mb_left;
}
// Check defend
else if (inputDefend && !holdingTool)
{
	// Get defend x/y origin
	var _x = x + lengthdir_x(weaponDistance,frontAngleDegrees), _y = y + lengthdir_y(weaponDistance,frontAngleDegrees);
	
	// Create weapon
	heldTool = instance_create_layer(_x,_y,"Instances",currentShield);
	with (heldTool)
	{
		image_angle = other.frontAngleDegrees;
		owner = other;
		distanceFromOwner = other.weaponDistance;
	}
	
	// Enable hold tool state
	holdingTool = true;
	buttonHoldTool = mb_right;
}

// Update move direction
moveDirection.x = inputRight - inputLeft;
moveDirection.y = inputDown - inputUp;

// Update rigid body
updateRigidBody();