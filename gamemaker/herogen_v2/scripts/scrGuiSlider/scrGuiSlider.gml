/// @function	Slider(string:name, real:x, real:y, int:min, int:max, int:interval, int:value)
function Slider(_name, _x, _y, _min, _max, _interval, _value) : GUIElement() constructor {
	
	// passed-in vars
	name		= _name;
	x			= _x;
	y			= _y;
	minimum		= floor(min(_min, _max));
	maximum		= floor(max(_min, _max));
	interval	= floor(clamp(_interval, _min, _max));
	
	// x-coordinate to draw end of slider rectangle
	tip_x		= 0;

	/// @function	set(int:value)
	static set = function(_value) {
		
		// floor value to nearest interval amount
		_value = (floor(_value / interval) * interval);
	
		value = _value;
		
		// determine ending x-coord of slider, used for drawing
		tip_x = remap(value, minimum, maximum, x, x + width);
		
		show_debug_message("You set the Slider named `" + string(name) + "` to the value `" + string(get()) + "`!");	
		
	}
	
	/// @function	remap(val, min1, max1, min2, max2)
	/// @desc		remaps a given value over one range to another
	/// @returns	{real}	remapped value
	static remap = function(val, min1, max1, min2, max2) {
		return min2 + (max2 - min2) * ((val - min1) / (max1 - min1));
	}
	
	/// @function	get()
	static get = function() {
		return value;	
	}
	
	/// @function	listen()
	static listen = function() {
		// set slider value based on mouse x coord
		set(remap(clamp(mouse_x, x, x + width), x, x + width, minimum, maximum)); 
					
		// left click release will un-focus the slider
		if (mouse_check_button_released(mb_left)) remove_focus();
	}
	
	/// @function	draw()
	static draw = function() {
		draw_rectangle(x, y, x + width, y + height, true); // outer box
		draw_rectangle(x, y, tip_x, y + height, false); // value box
		draw_text(x + width + padding, y + (height * 0.5), string(name) + ": " + string(get())); // text	
	}
	
	// set value
	set(_value);
	
}