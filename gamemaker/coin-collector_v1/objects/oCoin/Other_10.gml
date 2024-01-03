/// @desc Activate
state = CoinState.ACTIVE;
image_alpha = 1;

// Check if last coin
if (oGame.coins+2 < oGame.max_coins)
{
	var _i = 0;
	while (_i < 1000)
	{
		// Get random point
		var _x = irandom_range(oGame.spawn_x_offset,room_width-oGame.spawn_x_offset);
		var _y = irandom_range(oGame.spawn_y_offset,room_height-oGame.spawn_y_offset);
		if (distance_to_point(_x,_y) > 63)
		{
			// Spawn coin, break loop
			next_coin = instance_create_layer(_x,_y,"Instances",oCoin);
			break;
		}
		_i++;
	}
}