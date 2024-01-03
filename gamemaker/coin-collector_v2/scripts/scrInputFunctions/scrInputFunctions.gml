/// @func					check_input(input);
/// @param	{real}	input	The input to check
/// @desc					Checks if the given value has been inputted.

function check_input(_input)
{
	// Check input
	switch (_input)
	{
		case Input.LEFT:
			return (keyboard_check(ord("A")) || keyboard_check(vk_left) || (gamepad_axis_value(0,gp_axislh) < 0) || gamepad_button_check(0,gp_padl));
			break;
		case Input.RIGHT:
			return (keyboard_check(ord("D")) || keyboard_check(vk_right) || (gamepad_axis_value(0,gp_axislh) > 0) || gamepad_button_check(0,gp_padr));
			break;
		case Input.DOWN:
			return (keyboard_check(ord("S")) || keyboard_check(vk_down) || (gamepad_axis_value(0,gp_axislv) > 0.5) || gamepad_button_check(0,gp_padd));
			break;
		case Input.JUMP_PRESSED:
			return (keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("Z")) || gamepad_button_check_pressed(0,gp_face1));
			break;
		case Input.JUMP_RELEASED:
			return (keyboard_check_released(vk_space) || keyboard_check_released(ord("Z")) || gamepad_button_check_released(0,gp_face1));
			break;
		case Input.INTERACT_PRESSED:
			return (keyboard_check_pressed(ord("E")) || keyboard_check_pressed(ord("X")) || gamepad_button_check_pressed(0,gp_face3));
			break;
		case Input.PAUSE:
			return (keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(0,gp_start));
			break;
		case Input.SELECT:
			return (keyboard_check_pressed(vk_tab) || gamepad_button_check_pressed(0,gp_select));
			break;
		case Input.FULLSCREEN:
			return (keyboard_check_pressed(vk_f11));
			break;
		case Input.MUTE:
			return (keyboard_check_pressed(vk_f4));
			break;
		default:
			// Could not identify input
			return false;
	}
}