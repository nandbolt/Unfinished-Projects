/// @func	clear_world();
/// @desc	Clears world
function clear_world()
{
	for (var _gy = last_gy; _gy >= 0; _gy--)
	{
		for (var _gx = last_gx; _gx >= 0; _gx--)
		{
			var _x = _gx * TILE_SIZE, _y = _gy * TILE_SIZE;
			tilemap_set_at_pixel(worldtiles,0,_x,_y);
		}
	}
}