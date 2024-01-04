/// @function	Button({name} name,{float} x,{float} y,{function} onClick)
function Button(_name, _x, _y, _onClick=function(){}) : GUIElement() constructor 
{
	
	// passed-in vars
	name		= _name;
	x			= _x;
	y			= _y;
	onClick = _onClick;
	
	/// @function	click()
	static click = function() {
		set_focus();
		show_debug_message("You clicked the button named `" + string(name) + "`!");
		onClick();
	}
	
	/// @function	draw()
	static draw = function() {
		draw_rectangle(x, y, x + width, y + height, true);
		draw_text(x + (width*0.5) - (string_width(name) * 0.5), y + (height * 0.5), name);
	}
	
}