/// @desc Init

// Inherit the parent event
event_inherited();

// Thirst
max_thirst = 100;
curr_thirst = 75;
thirst_rate = 30;	// 120
thirst_counter = 0;

// Instance AI
my_brain = instance_create_layer(0,0,"Instances",obj_human_ai);
with (my_brain)
{
	my_body = other.id;
}