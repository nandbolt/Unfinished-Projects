/// @desc Food
hungry = false;
alarm[1] = 12 * 60;

// Move bush
var _sp = instance_find(oBushSpawnPoints,irandom(instance_number(oBushSpawnPoints) - 1));
oBush.x = _sp.x;
oBush.y = _sp.y;