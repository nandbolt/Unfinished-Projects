/// @function	Checkbox(string:name, real:x, real:y, bool:checked)
function Checkbox(_name, _x, _y, _checked) : GUIElement() constructor {
	
	// passed-in vars
	x			= _x;
	y			= _y;
	name		= _name;
	
	/// @function	click()
	static click = function() {
		set_focus();
		set(!get());	
		show_debug_message("You " + (get() ? "checked" : "unchecked") + " the Checkbox named `" + string(name) + "`!");	
	}
	
	/// @function	draw()
	static draw = function() {
		draw_rectangle(x, y, x + height, y + height, !get()); // box
		draw_text(x + height + padding, y + (height * 0.5), name); // name	
	}
	
	// set value
	set(_checked);
	
}