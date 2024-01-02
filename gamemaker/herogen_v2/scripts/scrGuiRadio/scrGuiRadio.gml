/// @function	Radio(string:name, struct:group, real:x, real:y, bool:checked)
function Radio(_name, _group, _x, _y, _checked) : GUIElement() constructor {
	
	// passed-in vars
	name		= _name;
	group		= _group;
	x			= _x;
	y			= _y;
	
	/// @function	get()
	static get = function() {
		// are we the group's selected option?
		return (group.checked_struct == self);
	}
	
	/// @function	set()
	static set = function() {
		// tell group we're the selected option
		group.checked_struct = self;
		show_debug_message("You checked the Radio Button named `" + string(name) + "` in the group named `" + string(group.name) + "`!");	
	}
	
	/// @function	click()
	static click = function() {
		set_focus();
		if (!get()) set();
	}
	
	/// @function	draw()
	static draw = function() {
		draw_circle(x + (height*0.5), y + (height*0.5), (height * 0.5), true); // outer circle
		if (get()) draw_circle(x + (height*0.5), y + (height*0.5), (height * 0.25), false); // inner circle
		draw_text(x + height + padding, y + (height * 0.5), name); // name	
	}

	// set value
	if (_checked) set();
	
}

/// @function	RadioGroup(string:name)
function RadioGroup(_name) constructor {
	
	controller	= global.__ElementController;
	
	// passed-in vars
	name		= _name;
	
	// add this radio group to the controller's list of radio groups
	ds_list_add(controller.radio_groups, self);
	
	// radio element, belonging to this group, that is the selected option
	checked_struct = undefined;
	
	/// @function	destroy()
	static destroy = function() {
		
		// locate & remove this struct from the controller's list of radio groups
		ds_list_delete(controller.radio_groups,
			ds_list_find_index(controller.radio_groups, self)
		);
	}
	
}