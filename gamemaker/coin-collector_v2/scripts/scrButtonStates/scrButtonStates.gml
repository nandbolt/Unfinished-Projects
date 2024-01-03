function button_state_inactive()
{
}

function button_state_active()
{
	if (state_new)
	{
		text = "";
	}
}

function button_state_nearby()
{
	if (state_new)
	{
		text = nearby_text;
	}
	
	// Check if player nearby
	if (!place_meeting(x,y,oPlayer))
	{
		// NEARBY -> ACTIVE
		state_switch("Active");
	}
}