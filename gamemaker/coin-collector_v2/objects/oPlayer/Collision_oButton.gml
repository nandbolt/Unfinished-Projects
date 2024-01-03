/// @desc Text
with (other)
{
	if (state_name == "Active")
	{
		// ACTIVE -> NEARBY
		state_switch("Nearby");
	}
}