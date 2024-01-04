/// @desc Dinner Time

// Eat crop
if (curr_hunger + 25 > max_hunger)
{
	curr_hunger = 100;
}
else
{
	curr_hunger += 25;
}