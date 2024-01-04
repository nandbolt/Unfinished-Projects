/// @func	updatePlayerInputs();
/// @desc	Updates player inputs.
function updatePlayerInputs()
{
	// Movement
	inputLeft = keyboard_check(ord("A"));
	inputRight = keyboard_check(ord("D"));
	inputUp = keyboard_check(ord("W"));
	inputDown = keyboard_check(ord("S"));
	
	// Orientation
	mouseAngleDegrees = point_direction(x,y,mouse_x,mouse_y);
	
	// Combat
	inputAttack = mouse_check_button(mb_left);
	inputDefend = mouse_check_button(mb_right);
	inputHoldTool = mouse_check_button(buttonHoldTool);
}