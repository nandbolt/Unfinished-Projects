/// @desc Init

// Inherit the parent event
event_inherited();

// Mode
mode = GameMode.COLLECT20;
mode_coin_cnt = 20;
sprite_index = sCoinIdle20;

// Coin array (Trail Mode)
//coin_arr = [[816,400],[1104,656],[1104,400],[816,656],[(816+1104)/2,(400+656)/2]];
coin_arr = [[304,288],[432,176],[656,176], [784,176],[944,80],[1168,80], [1232,176], [1120,208]];
coin_idx = 0;

// Button
button = noone;

// INACTIVE -> ACTIVE
state_switch("Active");