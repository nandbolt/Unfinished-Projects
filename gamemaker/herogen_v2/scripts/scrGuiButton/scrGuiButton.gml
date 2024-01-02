/// @function	Button(string:name, real:x, real:y, func:on_click)
function Button(_name, _x, _y,_on_click=function(){}) : GUIElement() constructor {
	
	// passed-in vars
	name		= _name;
	x			= _x;
	y			= _y;
	on_click	= _on_click;
	
	/// @function	click()
	static click = function() {
		set_focus();
		show_debug_message("You clicked the button named `" + string(name) + "`!");
		on_click();
	}
	
	/// @function	draw()
	static draw = function() {
		draw_rectangle(x, y, x + width, y + height, true);
		draw_text(x + (width*0.5) - (string_width(name) * 0.5), y + (height * 0.5), name);
	}
	
}