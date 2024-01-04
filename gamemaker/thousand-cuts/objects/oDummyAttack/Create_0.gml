/// @desc Init

// Inherit the parent event
event_inherited();

// Tool
holdingTool = false;
heldTool = noone;
weaponDistance = 24;
attackTime = 60;

// Start attack timer
alarm[0] = attackTime;