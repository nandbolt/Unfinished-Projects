/// @desc Keep Track Of Hero

// Check if hero exists
if (instance_exists(hero))
{
	// Check if hero changed chunk
	var _hgx = floor(hero.x / CHUNK_SIZE), _hgy = floor(hero.y / CHUNK_SIZE);
	if (_hgx != hgx || _hgy != hgy)
	{
		// Despawn faraway chunks
		despawn_far_chunks(_hgx,_hgy);
	
		// Spawn nearby chunks
		spawn_nearby_chunks(_hgx,_hgy);
	
		// Save new chunk coordinates
		hgx = _hgx;
		hgy = _hgy;
	}
}