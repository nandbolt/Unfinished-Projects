/// @func	octave_perlin({real} x,{real} y,{real} z,{int} octaves,{real} persistence);
/// @desc	Layers perlin noises together
function octave_perlin(_x,_y,_z,_octaves,_persistence)
{
	var _total = 0;
	var _frequency = 1;
	var _amplitude = 1;
	var _max_value = 0;
	
	for (var _i = 0; _i < _octaves; _i++)
	{
		_total += perlin(_x * _frequency, _y * _frequency, _z * _frequency) * _amplitude;
		
		_max_value += _amplitude;
		
		_amplitude *= _persistence;
		_frequency *= 2;
	}
	
	return _total / _max_value;
}


/// @func	perlin({real} x,{real} y,{real} z);
/// @desc	Returns a value between 0 and 1.
function perlin(_x,_y,_z)
{
	// If any repeat on, change coordinates to "local" repetitions
	if (repeated > 0)
	{
		_x = _x % repeated;
		_y = _y % repeated;
		_z = _z % repeated;
	}
	
	/*
	Calculate "unit cube" that point will be located in.
	Left bound is (x,y,z), right bound is that plus 1.
	Next we calculate location from 0 to 1 in that cube.
	*/
	var _xi = floor(_x) & 255;
	var _yi = floor(_y) & 255;
	var _zi = floor(_z) & 255;
	var _xf = _x - floor(_x);
	var _yf = _y - floor(_y);
	var _zf = _z - floor(_z);
	
	var _u = fade(_xf);
	var _v = fade(_yf);
	var _w = fade(_zf);
	
	/*
	HASH FUNCTION
	
	Wikipedia ~ any function that can be used to map data of arbitrary size to data of fixed size, with slight
	differences in input data producintg very big differences in output data.
	*/
	var _aaa = p[p[p[_xi]+_yi]+_zi];
	var _aba = p[p[p[_xi]+inc(_yi)]+_zi];
	var _aab = p[p[p[_xi]+_yi]+inc(_zi)];
	var _abb = p[p[p[_xi]+inc(_yi)]+inc(_zi)];
	var _baa = p[p[p[inc(_xi)]+_yi]+_zi];
	var _bba = p[p[p[inc(_xi)]+inc(_yi)]+_zi];
	var _bab = p[p[p[inc(_xi)]+_yi]+inc(_zi)];
	var _bbb = p[p[p[inc(_xi)]+inc(_yi)]+inc(_zi)];
	
	var _x1 = lerp(grad(_aaa,_xf,_yf,_zf),grad(_baa,_xf-1,_yf,_zf),_u);
	var _x2 = lerp(grad(_aba,_xf,_yf-1,_zf),grad(_bba,_xf-1,_yf-1,_zf),_u);
	var _y1 = lerp(_x1,_x2,_v);
	
	_x1 = lerp(grad(_aab,_xf,_yf,_zf-1),grad(_bab,_xf-1,_yf,_zf-1),_u);
	_x2 = lerp(grad(_abb,_xf,_yf-1,_zf-1),grad(_bbb,_xf-1,_yf-1,_zf-1),_u);
	var _y2 = lerp(_x1,_x2,_v);
	
	return (lerp(_y1,_y2,_w) + 1) * 0.5;
}


/// @func	fade({real} t);
/// @desc	Returns the output of the function 6t^(5)-15t^(4)+10t^(3).
function fade(_t)
{
	return _t * _t * _t * (_t * (_t * 6 - 15) + 10);
}


/// @func	inc({int} num);
/// @desc	Incrementer used for the hash function.
function inc(_num)
{
	_num++;
	if (repeated > 0) _num %= repeated;
	return _num;
}


/// @func	grad({int} hash,{real} x,{real} y,{real} z);
/// @desc	Calculates the dot product of a randomly selected gradient vector and 8 location vectors.
function grad(_hash,_x,_y,_z)
{
	switch (_hash & 0xF)
	{
		case 0x0: return  _x + _y;
        case 0x1: return -_x + _y;
        case 0x2: return  _x - _y;
        case 0x3: return -_x - _y;
        case 0x4: return  _x + _z;
        case 0x5: return -_x + _z;
        case 0x6: return  _x - _z;
        case 0x7: return -_x - _z;
        case 0x8: return  _y + _z;
        case 0x9: return -_y + _z;
        case 0xA: return  _y - _z;
        case 0xB: return -_y - _z;
        case 0xC: return  _y + _x;
        case 0xD: return -_y + _z;
        case 0xE: return  _y - _x;
        case 0xF: return -_y - _z;
        default: return 0;	// never happens
	}
}