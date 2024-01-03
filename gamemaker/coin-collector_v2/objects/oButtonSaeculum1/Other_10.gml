/// @desc Event

// Inherit the parent event
event_inherited();

if (coin != noone)
{
	oCoinMode.mode_coin_cnt = array_length(coin_arr);
	array_copy(oCoinMode.coin_arr, 0, coin_arr, 0, oCoinMode.mode_coin_cnt);
}