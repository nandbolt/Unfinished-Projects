/// @func	hero_update_inputs();
/// @desc	Updates hero inputs based on desired needs.
function hero_update_inputs()
{
	// Movement inputs
	input_left = keyboard_check(ord("A"));
	input_right = keyboard_check(ord("D"));
	input_down = keyboard_check(ord("S"));
	input_up = keyboard_check(ord("W"));
	
	// Rotation inputs
	rot = point_direction(x,y,mouse_x,mouse_y);
	
	// Action inputs
	action_interact = keyboard_check(vk_space);
	action_use_item = mouse_check_button_pressed(mb_left);
	action_throw_stance = mouse_check_button(mb_right);
}