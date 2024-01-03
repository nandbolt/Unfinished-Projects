/// @desc Init

// Text
nearby_text = "?";
text = "";

// Coin
coin = noone;
coin_x = x;
coin_y = y-64;

// Modes
modes = 0;
modeIdx = 0;
scores = 0;

#region State Machine

// Setup state machine
state_machine_init();

// Define states
state_create("Inactive",button_state_inactive);
state_create("Active",button_state_active);
state_create("Nearby",button_state_nearby);

// Set default state
state_init("Active");

#endregion

/// @func	setCoinMode({id} coin, {GameMode} mode);
setCoinMode = function(_coin, _mode)
{
	with (_coin)
	{
		// Choose game mode
		switch (_mode)
		{
			case GameMode.COLLECT20:
				mode = GameMode.COLLECT20;
				mode_coin_cnt = 20;
				sprite_index = sCoinIdle20;
				break;
			case GameMode.COLLECT50:
				mode = GameMode.COLLECT50;
				mode_coin_cnt = 50;
				sprite_index = sCoinIdle50;
				break;
			case GameMode.COLLECTTRAIL:
				mode = GameMode.COLLECTTRAIL;
				mode_coin_cnt = array_length(coin_arr);
				sprite_index = sCoinIdleTrail;
				break;
			case GameMode.ZEN:
				mode = GameMode.ZEN;
				mode_coin_cnt = infinity;
				sprite_index = sCoinIdleZen;
				break;
		}
		
		// Set button
		button = other;
	}
}