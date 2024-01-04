/// @function				state_machine_init();
/// @description			Initilize the variables required for the state engine.

function state_machine_init()
{
	state = noone;
	state_next = state;
	state_name = "Unknown";
	state_timer = 0;
	state_map = ds_map_create();
	state_stack = ds_stack_create();
	state_new = true;
	state_var[0] = 0;
}


/// @function					state_create(name,idx);
/// @param	{string}	name	Name of state
/// @param	{real}		idx		State index (enum)
/// @description				Creates a new state.

function state_create(_name,_idx)
{
	ds_map_replace(state_map,_name,_idx);
}


/// @function				state_cleanup();
/// @description			Cleans up state machine.

function state_cleanup()
{
	ds_map_destroy(state_map);
	ds_stack_destroy(state_stack);
}


/// @function				state_execute();
/// @description			Executes current state

function state_execute()
{
	// Runs the state's script (Should add error checking later)
	state();
}


/// @function				state_init(state);
/// @param	{real}	state	The state to initialize
/// @description			Initialize state

function state_init(_state)
{
	if (is_real(_state))
	{
		state = _state;
		state_name = "Unknown (Use the name to switch next time)";
	}
	else
	{
		state = ds_map_find_value(state_map,_state);
		state_name = _state;
	}
	state_next = state;
	ds_stack_push(state_stack,state);
	state_new = true;
}


/// @function				state_switch(state,*push);
/// @param	{real}	state	The state to switch to
/// @param	{real}	push	Whether to push to stack or not
/// @description			Switches states

function state_switch(_state,_push)
{
	if (is_real(_state))
	{
		state_next = _state;
		state_name = "Unknown (Use the name to switch next time)";
	}
	else
	{
		if (ds_map_exists(state_map,_state))
		{
			state_next = ds_map_find_value(state_map,_state);
			state_name = _state;
		}
		else
		{
			show_debug_message("Tried to switch to a non-existent state. Moving to first state.");
			state_next = ds_map_find_first(state_map);
			state_name = "Unknown (Tried to switch to a non-existent state)";
		}
	}
	if (_push)
	{
		ds_stack_push(state_stack,state_next);
	}
}


/// @function				state_switch_previous();
/// @description			Switch to previous state

function state_switch_previous()
{
	ds_stack_pop(state_stack);
	var _state = ds_stack_top(state_stack);
	state_switch(_state,false);
}


/// @function				state_update();
/// @description			Update state.

function state_update()
{
	if (state_next != state)
	{
		state = state_next;
		state_timer = 0;
		state_new = true;
	}
	else
	{
		state_timer++;
		state_new = false;
	}
}