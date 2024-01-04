/// @desc Self + HP
draw_self();

// Healthbar
draw_healthbar(x-4,y+10,x+4,y+8,(hp / hpMax) * 100,c_black,c_white,c_white,0,false,false);