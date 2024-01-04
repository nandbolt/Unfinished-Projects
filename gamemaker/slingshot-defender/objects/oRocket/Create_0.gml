/// @desc Init

// Inherit the parent event
event_inherited();

// Attack
damage = 5;

// Explosion
explosionDamage = 5;
explosionRadius = 16;

// Init rigid body
deacceleration = 1;

// Movement
maxLaunchSpeed = 3;

// Particles
particleTrailType = oParticles.particlesThrusterTrail;
particleTrailFrequency = 3;
particleTrailXOffset = 2;
particleTrailYOffset = 2;
particleTrailOffsetDistance = 4;

// Draw angle
drawAngleDeg = velocity.getAngleDeg();