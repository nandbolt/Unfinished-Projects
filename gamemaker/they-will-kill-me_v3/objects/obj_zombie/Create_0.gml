/// @desc Init

// Change color
image_blend = c_green;

// Inherit the parent event
event_inherited();

// Hunger
hunger_rate = 20;	// 180

// Instance AI
my_brain = instance_create_layer(0,0,"Instances",obj_zombie_ai);
with (my_brain)
{
	my_body = other.id;
}