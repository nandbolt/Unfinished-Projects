/// @desc Init

// Inherit
event_inherited();

// Inputs
inputLeft = false;
inputRight = false;
inputUp = false;
inputDown = false;
inputAttack = false;
inputDefend = false;
inputHoldTool = false;

// Buttons
buttonHoldTool = mb_left;

// Run movement
runSpeedMax = 4;
runAcceleration = 0.5;
runDeacceleration = 0.9;

// Hold tool movement
holdToolDeacceleration = 0.97;

// Orientation
mouseAngleDegrees = 0;
turnSpeed = 0.2;

// Tool
currentWeapon = oGreatsword;
currentShield = oShield;
holdingTool = false;
heldTool = noone;
weaponDistance = 24;

// Rigid body (physics)
initRigidBody();

// Update rigid body
maxSpeed = runSpeedMax;
acceleration = runAcceleration;
deacceleration = runDeacceleration;