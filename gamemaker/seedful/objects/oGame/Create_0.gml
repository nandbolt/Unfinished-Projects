	/// @desc Init

// Setup game
draw_set_font(fDefault);

// Dates
date = date_current_datetime();

// Water spout
sec_between_drops = 0.1;
spread = 0;
max_spread = 2;
spread_accel = 4;

// Weather
weather_data = 0;
weather_main = "";
weather_desc = "";
city_name = "austin";

// Start alarms
alarm[1] = 1;

// HTTP Request
http_get("https://api.openweathermap.org/data/2.5/weather?q="+city_name+"&appid=a087ff01c1f9eeeb7f214c3a31b57fae");