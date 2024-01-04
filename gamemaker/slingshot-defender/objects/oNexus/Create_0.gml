/// @desc Init Level

// States
roundStarted = false;
buildMode = false;

// Scorekeeping
waveCount = 1;
totalEnemyCount = 5;
totalEnemyDeaths = 0;

// Difficulty scaling variables
extraEnemiesPerWave = 5;
spawnFrequency = 31;
maxGroupSize = 2;

// Tilesets
collisionMap = layer_tilemap_get_id("CollisionTiles");
worldMap = layer_tilemap_get_id("WorldTiles");
gridMap = layer_tilemap_get_id("GridTiles");

// Spawn necessary objects
instance_create_layer(0,0,"Instances",oNavMesh);

#region Spawning functions

onEnemyDeath = function()
{
	totalEnemyDeaths++;
	
	// If this wave is complete
	if (totalEnemyDeaths >= totalEnemyCount)
	{
		// Update wave
		waveCount++;
	
		// Change state
		roundStarted = false;
	
		// Change text
		startWaveButton.name = "Start Wave "+string(waveCount);
		
		// Clear variables
		totalEnemyDeaths = 0;
	}
}

#endregion

#region Button functions

startWaveButtonOnClick = function()
{
	if (!roundStarted)
	{
		gm1StartWave(waveCount);
	}
};
swapProjectileButtonOnClick = function()
{
	// Swap projectiles
	with (oSlingshot)
	{
		switch (equippedProjectile)
		{
			case oRock:
				equippedProjectile = oRocket;
				break;
			default:
				equippedProjectile = oRock;
		}
	}
};
buildModeButtonOnClick = function()
{
	if (!buildMode)
	{
		// Show grid layer
		layer_set_visible("GridTiles",true);
	
		// Change state
		buildMode = true;
	}
	else
	{
		// Show grid layer
		layer_set_visible("GridTiles",false);
	
		// Change state
		buildMode = false;
	}
};

#endregion

// Create gui controller
guiController = new GUIElementController();

// Create buttons
startWaveButton = new Button("Start Wave", room_width * 0.5 - 24, room_height - 14, startWaveButtonOnClick);
swapProjectileButton = new Button("Swap", 16, room_height - 14, swapProjectileButtonOnClick);
buildModeButton = new Button("Build", room_width - 48 - 16, room_height - 14, buildModeButtonOnClick);