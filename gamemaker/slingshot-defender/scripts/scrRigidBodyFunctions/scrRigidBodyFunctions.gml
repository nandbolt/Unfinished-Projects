/// @func	initRigidBody();
/// @desc	Initializes object to include rigid body variables necessary for physics simulation.
function initRigidBody()
{
	// Vectors
	moveDirection = new Vector2();
	velocity = new Vector2();
	bounceVelocity = new Vector2();
	
	// Scalars
	maxSpeed = 2;
	acceleration = 0.5;
	deacceleration = 0.9;
	
	// Dimensions
	bboxWidth = bbox_right - bbox_left;
	bboxHeight = bbox_bottom - bbox_top;
	xBboxChecks = ceil(bboxHeight / TILE_SIZE) + 1;
	yBboxChecks = ceil(bboxWidth / TILE_SIZE) + 1;

	// Tilemaps
	collisionMap = layer_tilemap_get_id("CollisionTiles");
	
	// Collision
	collisionType = Collision.BOUNCE;
}

/// @func	cleanupRigidBody();
/// @desc	Destroys data structures used by rigid body.
function cleanupRigidBody()
{
	// Vectors
	delete moveDirection;
	delete velocity;
	delete bounceVelocity;
}

/// @func	updateRigidBody();
/// @desc	Handles physics simulation for rigid body, including collision handling.
function updateRigidBody()
{
	// Normalize move direction
	moveDirection.normalize();
	
	// Check if bounce velocity available
	if (bounceVelocity.x != 0)
	{
		// Apply x bounce velocity
		velocity.x = bounceVelocity.x;
		bounceVelocity.x = 0;
	}
	if (bounceVelocity.y != 0)
	{
		// Apply y bounce velocity
		velocity.y = bounceVelocity.y;
		bounceVelocity.y = 0;
	}
	
	// Update velocity
	if ((moveDirection.x == 0 && moveDirection.y == 0) || velocity.getLength() > maxSpeed)
	{
		// Deaccelerate velocity
		velocity.x *= deacceleration;
		velocity.y *= deacceleration;
	}
	else
	{
		var _xSpeedMax = abs(maxSpeed * moveDirection.x), _ySpeedMax = abs(maxSpeed * moveDirection.y);
		if (moveDirection.x == 0)
		{
			// Deaccelerate x velocity, accelerate y velocity
			velocity.x *= deacceleration;
			velocity.y = clamp(velocity.y + moveDirection.y * acceleration,-_ySpeedMax,_ySpeedMax);
		}
		else if (moveDirection.y == 0)
		{
			// Accelerate x velocity, deaccelerate y velocity
			velocity.x = clamp(velocity.x + moveDirection.x * acceleration,-_xSpeedMax,_xSpeedMax);
			velocity.y *= deacceleration;
		}
		else
		{
			// Accelerate velocity
			velocity.x = clamp(velocity.x + moveDirection.x * acceleration,-_xSpeedMax,_xSpeedMax);
			velocity.y = clamp(velocity.y + moveDirection.y * acceleration,-_ySpeedMax,_ySpeedMax);
		}
	}

	// Get integer velocity and declare collision variables
	var _ixVelocity = ceil(velocity.x * sign(velocity.x)) * sign(velocity.x), _iyVelocity = ceil(velocity.y * sign(velocity.y)) * sign(velocity.y);
	var _bboxSide;

	#region Handle horizontal (x) collisions

	// Check which bounding box to use
	if (_ixVelocity > 0) _bboxSide = bbox_right;
	else _bboxSide = bbox_left;

	// Check points on side until collision is detected or not
	for (var _i = 0; _i < xBboxChecks; _i++)
	{
		// Find point to check collision at
		var _x = _bboxSide + _ixVelocity, _y = round(bbox_top + _i * bboxHeight / (xBboxChecks - 1));
		var _tile = tilemap_get_at_pixel(collisionMap,_x,_y);
	
		// Check if tile is wall
		if (_tile == CollisionTile.WALL)
		{
			// Snap right
			if (_ixVelocity > 0) x = bbox_right - (bbox_right mod TILE_SIZE) + (x - bbox_right) + (TILE_SIZE - 1);
			// Snap left
			else x = bbox_left - (bbox_left mod TILE_SIZE) + (x - bbox_left);
			
			// Check collision type
			switch (collisionType)
			{
				case Collision.SLIDE:
					// Reset x velocity
					velocity.x = 0;
					break;
				case Collision.BOUNCE:
					// Reflect x velocity
					bounceVelocity.x = -velocity.x;
					velocity.x = 0;
					break;
				case Collision.STOP:
					// Stop velocity
					velocity.x = 0;
					velocity.y = 0;
					break;
			}
	
			// Stop collision checks
			break;
		}
	}

	#endregion

	// Update x position
	x += velocity.x;

	#region Handle vertical (y) collisions

	// Check which bounding box to use
	if (_iyVelocity > 0) _bboxSide = bbox_bottom;
	else _bboxSide = bbox_top;

	// Check points on side until collision is detected or not
	for (var _i = 0; _i < yBboxChecks; _i++)
	{
		// Find point to check collision at
		var _x = round(bbox_left + _i * bboxWidth / (yBboxChecks - 1)), _y = _bboxSide + _iyVelocity;
		var _tile = tilemap_get_at_pixel(collisionMap,_x,_y);
	
		// Check if tile is wall
		if (_tile == CollisionTile.WALL)
		{
			// Snap bottom
			if (_iyVelocity > 0) y = bbox_bottom - (bbox_bottom mod TILE_SIZE) + (y - bbox_bottom) + (TILE_SIZE - 1);
			// Snap top
			else y = bbox_top - (bbox_top mod TILE_SIZE) + (y - bbox_top);
			
			// Check collision type
			switch (collisionType)
			{
				case Collision.SLIDE:
					// Reset y velocity
					velocity.y = 0;
					break;
				case Collision.BOUNCE:
					// Store reflected y velocity
					bounceVelocity.y = -velocity.y;
					velocity.y = 0;
					break;
				case Collision.STOP:
					// Stop velocity
					velocity.x = 0;
					velocity.y = 0;
					break;
			}
	
			// Stop collision checks
			break;
		}
	}

	#endregion

	// Update y position
	y += velocity.y;
}