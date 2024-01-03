/// @desc Logic

// Inherit the parent event
event_inherited();

// Check if active
if (active)
{
	// Check if player is in hub
	if (!place_meeting(x,y,oPlayer))
	{
		// Switch to moving camera
		view_camera[0] = oCameraPlayer.camera;
		active = false;
		oCameraPlayer.active = true;
		
		// Move background
		layer_x("Background",oCameraPlayer.x-320);
		layer_y("Background",oCameraPlayer.y-180);
	}
}