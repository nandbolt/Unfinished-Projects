/// @desc Self

// Update draw angle
if (bounceVelocity.x != 0 && bounceVelocity.y != 0) drawAngleDeg = bounceVelocity.getAngleDeg();
else if (bounceVelocity.x != 0) drawAngleDeg = vec2GetAngleDeg(bounceVelocity.x,velocity.y);
else if (bounceVelocity.y != 0) drawAngleDeg = vec2GetAngleDeg(velocity.x,bounceVelocity.y);
else drawAngleDeg = velocity.getAngleDeg();

// Draw rocket
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,drawAngleDeg,image_blend,image_alpha);