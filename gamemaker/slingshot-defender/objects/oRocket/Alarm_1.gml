/// @desc Trail

// Calculate particle trail offset
particleTrailXOffset = -lengthdir_x(particleTrailOffsetDistance,drawAngleDeg) + 2;
particleTrailYOffset = -lengthdir_y(particleTrailOffsetDistance,drawAngleDeg) + 2;

// Inherit the parent event
event_inherited();