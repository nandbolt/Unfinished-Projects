/// @desc Update

// Update direction
moveDirection.x = mouse_x - x;
moveDirection.y = mouse_y - y;

// Update rigid body
updateRigidBody();