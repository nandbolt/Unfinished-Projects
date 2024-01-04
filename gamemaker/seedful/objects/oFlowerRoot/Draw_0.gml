/// @desc Self + GUI

// Self
draw_self();

// Water
draw_healthbar(x-16,y+8,x+16,y+10,(water_cnt/max_water_cnt)*100,c_black,c_white,c_white,0,true,true);