/// @desc Event

// Vector Field
draw_set_halign(fa_left);
draw_set_valign(fa_top);
if (oNexus.buildMode)
{
	for (var _yGrid = 0; _yGrid < yGridSize; _yGrid++)
	{
		for (var _xGrid = 0; _xGrid < xGridSize; _xGrid++)
		{
			// Figure out direction vector
			var _xDirection = pathGrid[_xGrid][_yGrid].x, _yDirection = pathGrid[_xGrid][_yGrid].y;
			var _x = _xGrid * TILE_SIZE + TILE_SIZE, _y = _yGrid * TILE_SIZE + TILE_SIZE;
		
			// Figure out which arrow to draw
			var _arrow = 0;
			if (_xDirection < 0) _arrow = 1;
			else if (_xDirection > 0) _arrow = 2;
			else if (_yDirection < 0) _arrow = 3;
			else if (_yDirection > 0) _arrow = 4;
		
			// Draw arrow
			draw_sprite(sArrows,_arrow,_x,_y);
		}
	}
}