/// @desc Self

// Held item
draw_sprite_ext(held_item_spr,0,rhand_x,rhand_y,1,1,rot,c_white,1);

// Main sprite
shader_set(shdColor);
shader_set_uniform_f_array(uni_color,body_color);
draw_sprite_ext(sprite_index,image_index,x,y,1,1,rot,c_white,1);
shader_set_uniform_f_array(uni_color,hair_color);
draw_sprite_ext(sHair1,0,x,y,1,1,rot,c_white,1);
shader_reset();