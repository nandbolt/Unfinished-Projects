/// @desc Free controller (and elements) from memory

// Save name
var _name = textfield_worldname.value;
with (oWorldGen)
{
	world_name = _name;
}

// Destroy gui elements
control.destroy();
delete control;