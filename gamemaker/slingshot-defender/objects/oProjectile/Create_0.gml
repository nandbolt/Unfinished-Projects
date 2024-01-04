/// @desc Init

// Movement
maxLaunchSpeed = 10;

// Attack
damage = 6;

// Particles
particleTrailType = oParticles.particlesTrail;
particleTrailFrequency = 3;
particleTrailXOffset = 0;
particleTrailYOffset = 0;

// Rigid body (physics)
initRigidBody();

// Init rigid body
deacceleration = 0.98;

// Start timers
alarm[0] = 180;
alarm[1] = particleTrailFrequency;