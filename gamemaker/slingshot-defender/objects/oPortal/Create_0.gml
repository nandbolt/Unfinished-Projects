/// @desc Init

// Spawning
totalSpawnCount = 5;
spawnCount = 0;
groupEnemySpawnCount = 0;
spawnFrequency = 60;
groupSpawnFrequency = 180;
maxGroupSize = 3;
groupSize = irandom_range(1,maxGroupSize);

// Particles
particleFrequency = 10;

// Start timers
alarm[0] = 180;
alarm[1] = particleFrequency;