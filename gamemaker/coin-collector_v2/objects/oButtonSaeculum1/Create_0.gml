/// @desc Event

// Inherit the parent event
event_inherited();

// Modes
modes = [GameMode.COLLECTTRAIL];
scores = [infinity];

// Set coin array
coin_arr = [];
with (oMarker)
{
		array_push(other.coin_arr, [x, y]);
}
instance_destroy(oMarker);