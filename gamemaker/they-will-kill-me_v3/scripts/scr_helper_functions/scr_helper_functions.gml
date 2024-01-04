/// @func	create_array(*args);
/// @desc	Creates and returns an array with the arguments provided
function create_array()
{
	var _arr;
	for (var i=0;i<argument_count;i++)
	{
		_arr[i] = argument[i];
	}
	return _arr;
}


/// @func				convert_point_to_str(x,y);
/// @param	{real}	x	X coordinate
/// @param	{real}	y	Y coordinate
/// @desc				Turns a point into a string and returns the value

function convert_point_to_str(_x,_y)
{
	return (string(_x)+","+string(_y));
}

/// @func					convert_str_to_point(str,coor);
/// @param	{real}	str		String to convert
/// @param	{real}	coor	Coordinate to return (X=0 OR Y=1)
/// @desc					Turns a string into a point coordinate and returns the value

function convert_str_to_point(_str,_coor)
{
	if (_coor == 0)
	{
		// Return X
		return (real(string_copy(_str,1,string_pos(",",_str)-1)));
	}
	else
	{
		// Return Y
		return (real(string_copy(_str,string_pos(",",_str)+1,string_length(_str)-string_pos(",",_str))));
	}
}