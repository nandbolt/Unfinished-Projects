/// @desc Init

// Setup
draw_set_font(fDefault);
randomize();

// PERSISTENT
total_coins = 0;
fastest_time = 999;

#region Load

// Check if file exists
if (file_exists("save_data.ini"))
{
	// Open file
	ini_open("save_data.ini");
	
	// Read file
	total_coins = ini_read_real("Stats","total_coins",total_coins);
	fastest_time = ini_read_real("Stats","fastest_time",fastest_time);
	
	// Close file
	ini_close();
}
else
{
	// Create file
	ini_open("save_data.ini");
	
	// Write to file
	ini_write_real("Stats","total_coins",total_coins);
	ini_write_real("Stats","fastest_time",fastest_time);
	
	// Close file
	ini_close();
}

#endregion

// Coins
coins = 0;
max_coins = 20;
spawn_x_offset = 192;
spawn_y_offset = 64;

// Time
time = 0;
time_step = 0;

// States
enum GameState
{
	ACTIVE,
	FINISHED,
	PAUSED
}
state = GameState.PAUSED;