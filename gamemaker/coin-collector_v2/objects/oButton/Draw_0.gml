/// @desc Self + Text

// Draw self
draw_self();

// Draw text
draw_set_halign(fa_center);
if (!instance_exists(oCoinMode)) draw_text_transformed(x,y-40,text,2,2,0);
else if (is_array(scores)) draw_text_transformed(x,y-40,string(scores[modeIdx]),2,2,0)