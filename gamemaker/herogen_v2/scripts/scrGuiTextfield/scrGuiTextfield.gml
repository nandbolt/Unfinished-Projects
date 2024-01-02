/// @function	Textfield(string:name, real:x, real:y, string:value, string:placeholder)
function Textfield(_name, _x, _y, _value, _placeholder) : GUIElement() constructor {
	
	// change text adding
	static padding = 8;
	
	// passed-in vars
	name		= _name;
	x			= _x;
	y			= _y;
	placeholder	= _placeholder;
	
	draw_value	= "";
	
	/**
	 * make `Textfield C` long
	 *	string comparisons like this aren't the best...
	 *	consider using Enumerators to uniquely define elements :)
	 */
	if (name == "Textfield C") width = 400;
	
	/// @function	set(string:str)
	static set = function(str) {
	
		// value hasn't changed; quit
		if (value == str) return;
		
		value = str;
		
		// keep deleteing the first letter of the string until it fits into the textfield box
		draw_set_font(fDefault);
		draw_value = value;
		while(string_width(draw_value) > (width - (2 * padding)))
			draw_value = string_delete(draw_value, 1, 1);
		
		show_debug_message("You set the Textfield named `" + string(name) + "` to the value `" + string(value) + "`");	
	
	}
	
	/// @function	click()
	static click = function() {
		set_focus();
		keyboard_string = get();	
	}
	
	/// @function	listen()
	static listen = function() {
		set(keyboard_string);	
		if (keyboard_check_pressed(vk_enter)) remove_focus();
	}
	
	/// @function	draw()
	static draw = function() {

		var in_focus = has_focus();
		var save_alpha = draw_get_alpha();
				
		if (!in_focus) draw_set_alpha(0.5);	
				
		// bounding box
		draw_rectangle(x, y, x + width, y + height, true);
				
		// flashing | at end of input value
		var ticker = (in_focus && floor((current_time * 0.002) % 2) == 0) ? "|" : "";
				
		// draw placeholder text
		if (string_length(get()) < 1) {
			draw_set_alpha(0.5);
			draw_text(x + padding, y + (height * 0.5), placeholder);
		}
				
		// draw input text
		draw_text(x + padding, y + (height * 0.5), draw_value + ticker);
				
		draw_set_alpha(save_alpha);	
		
	}
	
	// set value
	set(_value);
	
}