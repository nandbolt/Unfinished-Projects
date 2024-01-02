/// @func	generate_world2();
/// @desc	Generates world by randomly picking tiles
function generate_world2()
{
	// Update world name
	var _wordbank = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"];
	var _range = array_length(_wordbank);
	var _char_cnt = irandom_range(3,12);
	worldname = "";
	for (var _i = 1; _i <= _char_cnt; _i++)
	{
		var _char = _wordbank[irandom(_range-1)];
		if (_i == 1)
		{
			_char = string_upper(_char);
		}
		worldname += _char;
	}
	_wordbank = -1;
	
	for (var _gy = last_gy; _gy >= 0; _gy--)
	{
		for (var _gx = last_gx; _gx >= 0; _gx--)
		{
			var _tile = irandom_range(Tile.DEEP_SEA,Tile.SNOW);
			var _x = _gx * TILE_SIZE, _y = _gy * TILE_SIZE;
			tilemap_set_at_pixel(worldtiles,_tile,_x,_y);
		}
	}
}