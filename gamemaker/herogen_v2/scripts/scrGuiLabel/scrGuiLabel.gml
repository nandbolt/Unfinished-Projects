/// @function	Label(string:name, real:x, real:y)
function Label(_name, _x, _y) : GUIElement() constructor {
	
	// passed-in vars
	name		= _name;
	x			= _x;
	y			= _y;
	
	/// @function	draw()
	static draw = function() {
		draw_text(x + (width*0.5) - (string_width(name) * 0.5), y + (height * 0.5), name);
	}
	
}