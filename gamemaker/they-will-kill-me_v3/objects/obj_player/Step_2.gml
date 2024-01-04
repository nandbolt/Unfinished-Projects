/// @desc Update Game

// Update state
state_update();

// Update currency
if (curr_currency < max_currency)
{
	currency_counter += 1;
	
	if (currency_counter >= 60)
	{
		currency_counter = 0;
		curr_currency += 1;
	}
}