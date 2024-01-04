/// @func	gm1StartWave({int} wave);
/// @desc	Starts the wave for the 1st game mode: roguelike.
function gm1StartWave(_wave)
{
	// Calculate enemy count
	totalEnemyCount = _wave * extraEnemiesPerWave;
	maxGroupSize++;
	spawnFrequency = clamp(spawnFrequency-1,20,120);
	
	// Create portal
	var _portal = instance_create_layer(104,24,"Instances",oPortal);
	with (_portal)
	{
		totalSpawnCount = other.totalEnemyCount;
		spawnFrequency = other.spawnFrequency;
		maxGroupSize = other.maxGroupSize;
	}
	
	// Change state
	roundStarted = true;
		
	// Change text
	startWaveButton.name = "Wave "+string(waveCount)+"...";
}