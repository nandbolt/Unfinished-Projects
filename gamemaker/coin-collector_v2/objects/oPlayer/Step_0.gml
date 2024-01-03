/// @desc Logic

// Check menu inputs
if (check_input(Input.SELECT))
{
	draw_select_menu = !draw_select_menu;
}

// Interact
if (check_input(Input.INTERACT_PRESSED))
{
	var _button = instance_place(x,y,oButton);
	if (_button != noone)
	{
		with (_button)
		{
			// Press button
			event_user(0);
		}
	}
}

// Execute state
state_execute();

// Move and collide
move_and_collide_custom();