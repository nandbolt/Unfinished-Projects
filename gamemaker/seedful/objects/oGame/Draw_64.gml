/// @desc HUD
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Date, Time, Weather
draw_text(room_width/5,room_height/24,string(date_get_month(date))+"/"+string(date_get_day(date))+"/"+string(date_get_year(date)));
var _hour = date_get_hour(date);
var _hoff = "";
if (_hour < 10)
{
	_hoff = "0";
}
var _minute = date_get_minute(date);
var _moff = "";
if (_minute < 10)
{
	_moff = "0";
}
draw_text(room_width/2,room_height/24,_hoff+string(_hour)+":"+_moff+string(_minute));
draw_text(4*room_width/5,room_height/24,weather_main);
draw_text(room_width/2,room_height/12,weather_desc);

// Draw Button
