/// @desc Update

// If sprite is main & input isn't down
if (sprite_index == spriteMain && retractTool)
{
	// Retract tool
	sprite_index = spriteRetract;
}

// Update position
x = owner.x + lengthdir_x(distanceFromOwner,owner.frontAngleDegrees);
y = owner.y + lengthdir_y(distanceFromOwner,owner.frontAngleDegrees);

// Update angle
image_angle = owner.frontAngleDegrees;