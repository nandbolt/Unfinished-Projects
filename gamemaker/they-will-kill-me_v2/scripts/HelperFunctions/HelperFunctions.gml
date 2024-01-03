/// @function				create_array(*args);
/// @description			Creates and returns an array with the arguments provided

function create_array()
{
	var arr;
	for (var i=0;i<argument_count;i++)
	{
		arr[i] = argument[i];
	}
	return arr;
}

/// @function				convert_point_to_str(x,y);
/// @param	{real}	x		X coordinate
/// @param	{real}	y		Y coordinate
/// @description			Turns a point into a string and returns the value

function convert_point_to_str(_x,_y)
{
	return (string(_x)+","+string(_y));
}

/// @function				convert_str_to_point(str,coor);
/// @param	{real}	str		String to convert
/// @param	{real}	coor	Coordinate to return (X=0 OR Y=1)
/// @description			Turns a string into a point coordinate and returns the value

function convert_str_to_point(str,coor)
{
	if (coor == 0)
	{
		// Return X
		return (real(string_copy(str,1,string_pos(",",str)-1)));
	}
	else
	{
		// Return Y
		return (real(string_copy(str,string_pos(",",str)+1,string_length(str)-string_pos(",",str))));
	}
}


/// @function				heuristic(x1,y1,x2,y2);
/// @param	{real}	x1		Start X
/// @param	{real}	y1		Start Y
/// @param	{real}	x2		End X
/// @param	{real}	y2		End Y
/// @description			Returns Manhattan distance on a square grid (For priority)

function heuristic(x1,y1,x2,y2)
{
	return (abs(x1-x2)+abs(y1-y2));
}