/// @desc Event

if (keyboard_check_pressed(vk_f11))
{
	window_set_fullscreen(!window_get_fullscreen());
}
if (keyboard_check_pressed(vk_escape))
{
	game_end();
}
if (keyboard_check_pressed(ord("R")))
{
	room_restart();
}