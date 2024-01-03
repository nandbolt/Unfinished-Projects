/// @desc Water
thirsty = false;
alarm[0] = 10 * 60;

// Move bush
var _sp = instance_find(oWaterSpawnPoints,irandom(instance_number(oWaterSpawnPoints) - 1));
oWater.x = _sp.x;
oWater.y = _sp.y;