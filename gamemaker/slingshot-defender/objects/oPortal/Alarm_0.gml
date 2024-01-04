/// @desc Spawn Enemy

// Spawn enemy
instance_create_layer(x,y,"Instances",oEnemy);

// Increment spawn counter
spawnCount++;
groupEnemySpawnCount++;

// Check if spawned all enemies
if (spawnCount >= totalSpawnCount)
{
	// Destroy portal
	instance_destroy();
}
// Check if not done spawning group
else if (groupEnemySpawnCount < groupSize)
{
	// Reset alarm
	alarm[0] = spawnFrequency;
}
// Group done spawning
else
{
	// Create next group
	groupSize = clamp(irandom_range(1,maxGroupSize),1,totalSpawnCount-spawnCount);
	
	// Reset alarm
	alarm[0] = groupSpawnFrequency;
	
	// Reset variables
	groupEnemySpawnCount = 0;
}