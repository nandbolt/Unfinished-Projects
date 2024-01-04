/// @desc Update

// Update move direction
moveDirection = oNavMesh.pathGrid[floor(x / TILE_SIZE) - 1][floor(y / TILE_SIZE) - 1];

// Update rigid body
updateRigidBody();