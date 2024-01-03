/// @desc HUD

// Draw background sprite
draw_sprite_ext(sHudBackground,0,160,0,1,1,0,c_white,0.5);

// Left (Coins)
draw_sprite_ext(sHudCoin,0,166,7,1,1,0,c_yellow,1);
draw_set_halign(fa_left);
draw_text(182,4,string(coins_left));

// Right (Timer)
draw_sprite_ext(sHudTimer,0,166 + 200,7,1,1,0,c_white,1);
draw_set_halign(fa_left);
draw_text(182 + 200,4,string(millisecs));