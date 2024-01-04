/// @func	Vector2({float} x,{float} y)
/// @desc	Return a two-dimensional vector struct.
function Vector2(_x=0,_y=0) constructor
{
	// Coordinates
	x = _x;
	y = _y;
	
	/// @func	normalize();
	/// @desc	Normalizes (sets vector length to 1 [or leaves it at 0]) vector.
	static normalize = function()
	{
		// Return if (0,0) vector
		if (x == 0 && y == 0) return;
		
		// Find length
		var _length = sqrt(x * x + y * y);
		
		// Divide each component by length
		x /= _length;
		y /= _length;
	}
	
	/// @func	getLength();
	/// @desc	Returns the length of the vector.
	static getLength = function()
	{
		return sqrt(x * x + y * y);
	}
}