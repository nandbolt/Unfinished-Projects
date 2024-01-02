/// @desc Name / Menus

// Alignment
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Color
var _c = c_black;

// Draw background
//draw_rectangle_color(0,0,128,32,_c,_c,_c,_c,false);

// Name
//draw_text(0,0,worldname);

// Alignment
draw_set_valign(fa_bottom);

// Draw background
draw_rectangle_color(0,room_height,532,room_height-32,_c,_c,_c,_c,false);

// Controls
draw_text(0,room_height+6,"<>:ChangeType SPACE:Generate ESC:Quit F11:Fullscreen");