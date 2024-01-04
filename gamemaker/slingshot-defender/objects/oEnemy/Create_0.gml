/// @desc Init

// Life
hpMax = 10;
hp = hpMax;

// Rigid body (physics)
initRigidBody();

// Set rigid body
maxSpeed = 1;
collisionType = Collision.SLIDE;

// Reset alarm
alarm[0] = 30;