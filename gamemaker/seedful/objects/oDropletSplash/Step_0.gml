/// @desc Core Logic

// Inherit the parent event
event_inherited();

// Fade out
if (image_alpha <= 0)
{
	instance_destroy();
}
else
{
	image_alpha -= 0.03;
}