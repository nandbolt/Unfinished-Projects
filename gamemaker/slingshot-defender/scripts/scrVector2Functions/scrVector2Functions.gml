/// @func	vec2GetAngleDeg({float} x,{float} y);
/// @desc	Gets the angle of the vector; returns -1 if 0,0 vector
function vec2GetAngleDeg(_x,_y)
{
	if (_x == 0 && _y == 0) return -1;
	var _f_angle = radtodeg(arccos(_x / sqrt(_x * _x + _y * _y)))
	if (_y > 0)
	{
		_f_angle = 360 - _f_angle;
	}
	return _f_angle;
}