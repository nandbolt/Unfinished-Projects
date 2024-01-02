/// @desc Event

/// @desc Event
draw_set_halign(fa_left);
draw_set_valign(fa_top);
if (room == rWorldGen)
{
	draw_text(2,0,version+"  ESC:Quit  F11:Fullscreen  AWSD:Move");
}
else
{
	draw_text_transformed(2,0,version+"  ESC:Quit  F11:Fullscreen  AWSD:Move  FPS:"+string(fps),1,1,0);
}

// Check if hero is alive
if (hero_exists)
{
	draw_set_halign(fa_left);
	draw_text_transformed(2,170*2,"XY:("+string(x)+","+string(y)+")  CHUNK:("+string(floor(x / (TILES_PER_CHUNK * TILE_SIZE)))+","+string(floor(y / (TILES_PER_CHUNK * TILE_SIZE)))+")",1,1,0);

	// Held item gui
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	var _x = camera_width-30, _y = 10;
	if (oHero.held_item_cnt == 0)
	{
		shader_set(shdColor);
		shader_set_uniform_f_array(oHero.uni_color,oHero.body_color);
		draw_sprite_ext(oHero.held_item_gui_spr,0,_x,_y,4,4,0,c_white,1);
		shader_reset();
	}
	else
	{
		draw_sprite_ext(oHero.held_item_gui_spr,0,_x,_y,2,2,0,c_white,1);
	}
	draw_text_transformed(_x,_y,string(oHero.held_item_cnt),1,1,0);

	// Hunger meter
	draw_text_transformed(_x,_y+16,"H:"+string(oHero.hunger_cnt)+"/"+string(oHero.max_hunger_cnt),1,1,0);
}