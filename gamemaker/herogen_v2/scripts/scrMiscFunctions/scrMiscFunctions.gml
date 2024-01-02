/// @func				get_manhattan_distance(x1,y1,x2,y2);
/// @param	{real}	x1	X coordinate of 1st point
/// @param	{real}	y1	Y coordinate of 1st point
/// @param	{real}	x2	X coordinate of 2nd point
/// @param	{real}	y2	Y coordinate of 2nd point
/// @desc				Return the manhattan distance between two points.

function get_manhattan_distance(_x1,_y1,_x2,_y2)
{
	return (abs(_x1-_x2)+abs(_y1-_y2));
}