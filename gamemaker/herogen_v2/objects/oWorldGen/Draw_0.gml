/// @desc Event

// Draw map border
var _c = c_white;
var _x = rm_center_x, _y = map_cell_size;
draw_sprite_ext(sBorderNC,0,_x,_y,map_border_scale_x,map_border_scale_y,0,_c,1);

// Draw menu border
_x = rm_center_x;
_y = map_cell_size;
draw_sprite_ext(sBorder,0,8,40,menu_border_scale_x,menu_border_scale_y/10,0,_c,1);
draw_sprite_ext(sBorder,0,8,72,menu_border_scale_x,menu_border_scale_y/1.229,0,_c,1);