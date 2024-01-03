/// @desc Signal Game

if (oGame.state != GameState.PAUSED)
{
	instance_create_layer(x,y,"Instances",oCoinCollected);

	with (next_coin)
	{
		event_user(0);
	}

	with (oGame)
	{
		event_user(0);
	}
}