/// @desc Self

// Slingshot
draw_self();

// Band
if (slingDrawn)
{
	// Trajectory line
	draw_line(x,y,x-(mouse_x-x),y-(mouse_y-y));
	
	// Slingshot lines
	draw_line(x-TILE_SIZE,y,mouse_x,mouse_y);
	draw_line(x+TILE_SIZE,y,mouse_x,mouse_y);
	
	// Projectile
	draw_sprite(object_get_sprite(equippedProjectile),0,mouse_x,mouse_y);
}
else
{
	// Slingshot lines
	draw_line(x-TILE_SIZE,y,x+TILE_SIZE,y);
	
	// Projectile
	draw_sprite(object_get_sprite(equippedProjectile),0,x,y);
}