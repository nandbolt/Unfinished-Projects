/// @function	Dropdown(string:name, real:x, real:y, []string:options, int:index)
function Dropdown(_name, _x, _y, _options, _index) : GUIElement() constructor {
	
	// passed-in vars
	x			= _x;
	y			= _y;
	name		= _name;
	options		= _options;
	
	/// @function	listen()
	static listen = function() {
		
		if (!mouse_check_button_pressed(mb_left)) return;
		
		// prevent click-through to elements underneath the dropdown options
		controller.can_click = false;
		
		// check for click on any options
		for(var i = array_length(options)-1; i>=0; i--) {
			if (!point_in_rectangle(mouse_x, mouse_y,
				x, y + (height * (i+1)), x + width, y + (height * (i+2)))) continue;
				
			set(i);
			
			show_debug_message("You selected option #" + string(get()) +
				" (`" + (options[get()]) + "`) in the Dropdown named `" + string(name) + "`!");	
				
			return;
		}
		
	}
	
	/// @function	draw()
	static draw = function() {
				
		if (has_focus()) {
					
			// draw coverup behind all options
			var save_color = draw_get_color();
			draw_set_color(c_black);
			draw_rectangle(x, y + (height), x + width, y + (height * (array_length(options)+1)), false);
			draw_set_color(save_color);
					
			// draw options
			for(var i = array_length(options)-1; i>=0; i--) {
				draw_rectangle(x, y + (height * (i+1)), x + width, y + (height * (i+2)), true);
				draw_text(x + padding, y + (height * (i+1.5)), options[i]); // option name
			}
			
			// down arrow
			draw_text(x + width - (padding * 2), y + (height * 0.5), "v"); // down arrow

		}
				
		draw_rectangle(x, y, x + width, y + height, true); // bounding box
		draw_text(x + padding, y + (height * 0.5), options[get()]); // name
					
	}
	
	// set value
	set(_index);
	
}