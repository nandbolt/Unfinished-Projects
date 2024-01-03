/// @func	spawn_next_coin(*cx,cy);
/// @desc	Spawns the next coin in the chain.

function spawn_next_coin()
{
	// Declare variable
	var _coin = noone;
	
	// Check if no arguments
	if (argument_count == 0)
	{
		// Loop till coin spawns
		repeat (1000)
		{
			// Get random point
			var _x = irandom_range(816,1104);
			var _y = irandom_range(400,656);
		
			// Check if point is far enough from current coin
			if (distance_to_point(_x,_y) > 63)
			{
				// Spawn coin
				_coin = instance_create_layer(_x,_y,"Instances",oCoin);
				break;
			}
		}
	}
	else
	{
		// Spawn coin
		_coin = instance_create_layer(argument[0],argument[1],"Instances",oCoin);
	}
	
	// Return coin
	return _coin;
}


/// @func	collect_coin();
/// @desc	Collect coin and activate new one.

function collect_coin()
{
	// ACTIVE -> COLLECTED
	state_switch("Collected");
		
	// Check if game mode coin
	if (object_index == oCoinMode)
	{
		// Start game
		var _mode = instance_create_layer(x,y,"Instances",oMode);
		with (_mode)
		{
			// Set mode
			mode = other.mode;
			coins_left = other.mode_coin_cnt;
			button = oCoinMode.button;
			
			// Set coin array
			array_copy(coin_arr,0,oCoinMode.coin_arr,0,array_length(oCoinMode.coin_arr));
		}
		
		// Reset button coin
		oButton.coin = noone;
		
		// Check if mode is trail
		if (mode == GameMode.COLLECTTRAIL)
		{
			// Spawn 2 starter coins
			var _x1 = oMode.coin_arr[oMode.coin_idx][0], _y1 = oMode.coin_arr[oMode.coin_idx][1];
			oMode.coin_idx++;
			var _x2 = oMode.coin_arr[oMode.coin_idx][0], _y2 = oMode.coin_arr[oMode.coin_idx][1];
			oMode.coin_idx++;
			
			// Spawn 2 starter coins
			var _coin = spawn_next_coin(_x1,_y1);
			with (_coin)
			{
				// INACTIVE -> ACTIVE
				state_switch("Active");
				
				// Spawn next coin
				next_coin = spawn_next_coin(_x2,_y2);
				next_coin.image_alpha = 0.25;
			}
		}
		else
		{
			// Spawn 2 starter coins
			var _coin = spawn_next_coin();
			with (_coin)
			{
				// INACTIVE -> ACTIVE
				state_switch("Active");
				
				// Spawn next coin
				next_coin = spawn_next_coin();
				next_coin.image_alpha = 0.25;
			}
		}
	}
	else
	{
		// Check if mode exists
		if (instance_exists(oMode))
		{
			with (oMode)
			{
				// Decrement coins left
				coins_left--;
					
				// Check if no coins left
				if (coins_left <= 0)
				{
					// Mode complete
					event_user(0);
				}
			}
			
			// Check if next coin exists
			if (next_coin != noone)
			{
				// Activate next coin
				with (next_coin)
				{
					// INACTIVE -> ACTIVE
					state_switch("Active");
						
					// Check if done spawning coins
					if (oMode.coins_left > 1)
					{
						// Check if trail mode
						if (oMode.mode == GameMode.COLLECTTRAIL)
						{
							// Get x and y of coin
							var _x = oMode.coin_arr[oMode.coin_idx][0], _y = oMode.coin_arr[oMode.coin_idx][1];
							oMode.coin_idx++;
							
							// Spawn coin
							next_coin = spawn_next_coin(_x,_y);
						}
						else
						{
							// Spawn coin
							next_coin = spawn_next_coin();
						}
						next_coin.image_alpha = 0.25;

						// Check if last coin
						if (!(oMode.coins_left-1 > 1))
						{
							next_coin.image_blend = c_green;
						}
					}
				}
			}
		}
	}
}