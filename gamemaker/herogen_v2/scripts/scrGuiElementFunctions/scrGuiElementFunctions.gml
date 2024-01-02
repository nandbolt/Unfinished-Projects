/// @function	GUIElementController()
/// @desc		The main handler, and renderer, of all GUI elements
function GUIElementController() constructor {
	
	// make this struct a global variable so all elements can reference easily
	global.__ElementController = self;
	
	// list of all GUI elements
	elements			= ds_list_create();
	
	// list of all radio button groups
	radio_groups		= ds_list_create();
	
	element_in_focus	= undefined;	// the GUI element struct in focus currently
	can_click			= true;			// prevents click-throughs on overlapping elements
	clicked_any_element = false;		// did we click *any* element this gamestep? used for de-focusing elements
	
	active = true;
	
	/// @function	step()
	static step = function() {
		
		// reset focus and click flags each gamestep
		clicked_any_element = false;
		can_click = true;
		
		// call `step` function in all elements
		var count = ds_list_size(elements);
		for(var i = 0; i < count; i++) elements[| i].step();
		
		// no element brought into focus this frame, clear in-focus flag
		if (!clicked_any_element && !can_click)
			element_in_focus = undefined;
		
	}
	
	/// @function	draw()
	static draw = function() {
		
		draw_set_font(fDefault);
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		draw_set_color(c_white);
		draw_set_alpha(1);
				
		// call `draw` function on all elements in reverse-creation order
		for(var i = ds_list_size(elements)-1; i>=0; i--)
			elements[| i].draw();
		
	}
	
	/// @function	destroy()
	static destroy = function() {
		
		// free all elements from memory
		for(var i = ds_list_size(elements)-1; i>=0; i--)
			elements[| i].destroy();
		ds_list_destroy(elements);
		
		// free all radio groups from memory
		for(var i = ds_list_size(radio_groups)-1; i>=0; i--)
			radio_groups[| i].destroy();
		ds_list_destroy(radio_groups);
		
		// remove global reference
		delete global.__ElementController;
		global.__ElementController = undefined;
		
	}
	
}


/// @function	GUIElement()
/// @desc		A general 'class' that all our element types will inherit
function GUIElement() constructor {
	
	controller	= global.__ElementController;
	
	// int, string, or bool based on type
	value		= undefined;
	
	// unique identifier
	name		= undefined;
	
	// dimensions
	static width	= 100;
	static height	= 16;
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