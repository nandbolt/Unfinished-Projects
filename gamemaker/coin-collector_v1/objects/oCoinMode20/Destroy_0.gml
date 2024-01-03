/// @desc Signal Game

instance_create_layer(x,y,"Instances",oCoinWhiteCollected);

with (oGame)
{
	state = GameState.ACTIVE;
	audio_play_sound(mDrums,1,true);
	audio_play_sound(mSynth,1,true);
	audio_sound_gain(mSynth,0,0);
	
	// Spawn coin randomly
	var _x = irandom_range(spawn_x_offset,room_width-spawn_x_offset);
	var _y = irandom_range(spawn_y_offset,room_height-spawn_y_offset);
	var _first_coin = instance_create_layer(_x,_y,"Instances",oCoin);
	with (_first_coin)
	{
		// Activate coin
		event_user(0);
	}
	
	event_user(0);
}