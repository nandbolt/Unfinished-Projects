/// @desc Event

// Save levels
var _sealevel = slider_sealevel.get();
var _grasslevel = slider_grasslevel.get();
var _snowlevel = slider_snowlevel.get();
with (oWorldGen)
{
	world_sealevel = _sealevel;
	world_grasslevel = _grasslevel;
	world_snowlevel = _snowlevel;
}

// Destroy self like parent
event_inherited();