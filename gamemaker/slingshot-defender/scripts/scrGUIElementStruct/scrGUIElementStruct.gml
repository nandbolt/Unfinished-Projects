/// @function	GUIElement()
/// @desc		A general 'class' that all our element types will inherit
function GUIElement() constructor
{
	
	controller	= global.__ElementController;
	
	// int, string, or bool based on type
	value		= undefined;
	
	// unique identifier
	name		= undefined;
	
	// dimensions
	static width	= 48;
	static height	= 12;
	static padding	= 16;
	
	// add to controller's list of elements
	ds_list_add(controller.elements, self);	
	
	/// @function	destroy()
	static destroy = function() {
		// remove from controller's list of elements
		ds_list_delete(controller.elements,
			ds_list_find_index(controller.elements, self)
		);
	}

	/// @function	has_focus()
	static has_focus = function() {
		return controller.element_in_focus == self;
	}
	
	/// @function	set_focus()
	static set_focus = function() {
		controller.element_in_focus = self;	
		controller.clicked_any_element = true;
	}
	
	/// @function	remove_focus()
	static remove_focus = function() {
		controller.element_in_focus = undefined;
	}
	
	/// @function	get()
	static get = function() {
		return value;
	}

	/// @function	set(*:value)
	static set = function(_value) {
		value = _value;
	}
	
	/// @function	step()
	static step = function() {
		
		// check for mouse click inside bounding box AND ensure no click already happened this gamestep
		if (mouse_check_button_pressed(mb_left) && controller.can_click &&
			point_in_rectangle(mouse_x, mouse_y, x, y, x + width, y + height)) {
			
			// tell controller we clicked on an input this step
			controller.can_click = false;
								
			click();
			
		}
		
		// if the element has focus, listen for input
		if (has_focus()) listen();
	}
	

	/// @function	click()
	static click = function() {
		set_focus();
	}
	
	/// @function	listen()
	static listen = function() { /* */ }
	
	/// @function	draw()
	static draw = function() { /* */ }
	
}