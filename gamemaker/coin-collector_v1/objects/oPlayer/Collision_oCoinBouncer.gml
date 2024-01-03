/// @desc Collect

if (oGame.state != GameState.PAUSED)
{
	with (oGame)
	{
		event_user(0);
	}
}

with (other)
{
	instance_create_layer(x,y,"Instances",oCoinCollected);
	instance_destroy();
}