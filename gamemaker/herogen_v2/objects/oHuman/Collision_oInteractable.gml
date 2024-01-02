/// @desc Event

// Check if interacting
if (action_interact)
{
	// Check if empty handed
	if (held_item_cnt < 1)
	{
		// Execute interaction
		switch (other.object_index)
		{
			case oRock:
				held_item = oRock;
				held_item_spr = sRock;
				held_item_gui_spr = sRock;
				held_item_throwable = oRockProj;
				break;
			case oMeat:
				held_item = oMeat;
				held_item_spr = sMeat;
				held_item_gui_spr = sMeat;
				held_item_throwable = oMeat;
				break;
		}
	
		// Increment held item count
		held_item_cnt++;
	
		// Destroy interactable
		with (other)
		{
			instance_destroy();
		}
	}
	// Check if same item as in hand
	else if (other.object_index == held_item)
	{
		// Increment held item count
		held_item_cnt++;
	
		// Destroy interactable
		with (other)
		{
			instance_destroy();
		}
	}
}