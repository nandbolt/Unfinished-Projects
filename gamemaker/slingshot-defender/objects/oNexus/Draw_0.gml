/// @desc Menus + HUD

#region Top HUD

#region Left

// Left alignment
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Waves
// draw_text(0,0,"Wave "+string(waveCount));

#endregion

#region Right

// Right alignment
draw_set_halign(fa_right);

// Enemies
if (roundStarted)
{
	draw_text(room_width,0,"Enemies: "+string(totalEnemyDeaths)+"/"+string(totalEnemyCount));
}

#endregion

#endregion

// Gui
guiController.draw();