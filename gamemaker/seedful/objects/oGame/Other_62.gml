/// @desc Real-World Weather

alarm[2] = -1;

// Get request
var _json = async_load[? "result"];

// Convert json to map
var _map = json_decode(_json);
if (_map == -1)
{
	exit;
}

// Gather info
if (ds_map_exists(_map,"weather"))
{
	weather_data = _map[? "weather"];
	weather_main = weather_data[| 0][? "main"];
	weather_desc = weather_data[| 0][? "description"];
}