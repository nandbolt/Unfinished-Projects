/// @func	setupPathGrid();
/// @desc	Sets the grid and updates the direction field.
function setupPathGrid()
{
	// Init grid
	for (var _yGrid = yGridSize - 1; _yGrid >= 0; _yGrid--)
	{
		for (var _xGrid = xGridSize - 1; _xGrid >= 0; _xGrid--)
		{
			// Set field vector at point to down
			pathGrid[_xGrid][_yGrid] = new Vector2();
		}
	}
	
	// Update grid
	updatePathGrid()
}

/// @func	updatePathGrid();
/// @desc	Resets the grid and updates the direction field.
function updatePathGrid()
{
	// Clear grid
	for (var _yGrid = yGridSize - 1; _yGrid >= 0; _yGrid--)
	{
		for (var _xGrid = xGridSize - 1; _xGrid >= 0; _xGrid--)
		{
			// Set field vector at point to down
			pathGrid[_xGrid][_yGrid].x = 0;
			pathGrid[_xGrid][_yGrid].y = 0;
		}
	}
	
	// Create queue
	var _frontier = ds_queue_create();
	ds_queue_enqueue(_frontier,xGridGoal,yGridGoal);
	pathGrid[xGridGoal][yGridGoal].y = 1;
	
	// Loop until resolved
	while (!ds_queue_empty(_frontier))
	{
		// Get current point
		var _xGrid = ds_queue_dequeue(_frontier), _yGrid = ds_queue_dequeue(_frontier);
		
		// Add neighbors
		for (var _i = 0; _i < 4; _i++)
		{
			// Calculate offset
			var _xOffset = 0, _yOffset = 0;
			switch (_i)
			{
				// Left
				case 0:
					_xOffset--;
					break;
				// Right
				case 1:
					_xOffset++;
					break;
				// Up
				case 2:
					_yOffset--;
					break;
				// Down
				case 3:
					_yOffset++;
					break;
			}
		
			// Check if valid point
			var _xGridNear = _xGrid + _xOffset, _yGridNear = _yGrid + _yOffset;
			if (validPathPoint(_xGridNear,_yGridNear))
			{
				// Set direction to lead to current point
				if (_xOffset > 0) pathGrid[_xGridNear][_yGridNear].x = -1;
				else if (_xOffset < 0) pathGrid[_xGridNear][_yGridNear].x = 1;
				else if (_yOffset > 0) pathGrid[_xGridNear][_yGridNear].y = -1;
				else if (_yOffset < 0) pathGrid[_xGridNear][_yGridNear].y = 1;
					
				// Store point in queue
				ds_queue_enqueue(_frontier,_xGridNear,_yGridNear);
			}
		}
	}
	
	// Destroy queue
	ds_queue_destroy(_frontier);
}

/// @func	validPathPoint({int} xGrid,{int} yGrid);
/// @desc	Returns true or false if the point is valid.
function validPathPoint(_xGrid,_yGrid)
{
	if (_xGrid < 0 || _xGrid >= xGridSize || _yGrid < 0 || _yGrid >= yGridSize ||						// Out of range
		tilemap_get_at_pixel(collisionMap,(_xGrid + 1) * TILE_SIZE,(_yGrid + 1) * TILE_SIZE) == 1 ||	// Wall
		pathGrid[_xGrid][_yGrid].x != 0 || pathGrid[_xGrid][_yGrid].y != 0)								// Already has direction
	{
		return false;
	}
	return true;
}