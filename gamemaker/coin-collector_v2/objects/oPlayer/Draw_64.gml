/// @desc HUD + Menus

// Check if draw select menu
if (draw_select_menu)
{
	// Background
	draw_sprite_stretched_ext(sHudBox1,0,0,0,160,360,c_white,0.5);
	
	// Align text
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	// Make locals
	var _x = 4, _y = 0;
	
	#region Inventory
	
	// Title text
	draw_text_transformed(_x,_y,"Inventory",2,2,0);
	_y += 32;
	
	// Coins
	draw_text(_x,_y,"Coins = " + string(coins));
	_y += 32;
	
	#endregion
	
	#region Move list
	
	// Title text
	draw_text_transformed(_x,_y,"Move List",2,2,0);
	_y += 32;
	
	// Move list
	draw_text(_x,_y,"Jump : J + on ground");
	_y += 16;
	draw_text(_x,_y,"Short Jump : J release + in air");
	_y += 16;
	draw_text(_x,_y,"Wall Jump : J + on wall");
	_y += 16;
	draw_text(_x,_y,"Wall Dash : |-> + J + on wall");
	_y += 16;
	draw_text(_x,_y,"Dash Cancel : J release + while dash");
	_y += 16;
	draw_text(_x,_y,"Brake : Down + while dash");
	_y += 16;
	draw_text(_x,_y,"Flip Jump : J + in air + near ground");
	_y += 16;
	draw_text(_x,_y,"Minidash : J release + while flip");
	
	#endregion
}