#region Enums

enum Collision
{
	STOP,
	SLIDE,
	BOUNCE,
}

enum HumanState
{
	IDLE,
	RUNNING,
}

enum CollisionTile
{
	EMPTY,
	WALL,
	WATER,
}

enum Biome
{
	NONE,
	OCEAN,
	DIRT,
	GRASS,
	ROCK,
	SNOW,
}

#endregion

#region Macros

#macro TILE_SIZE 32
#macro TILES_PER_CHUNK 16		// Tiles per chunk (per row/column)
#macro CHUNK_SIZE 512			// (Tile size) * (tiles per chunk)
#macro RENDER_DIST 3			// Distance chunks are rendered (in chunks)

#endregion

#region Global Variables

global.version = "Herogen v0.0.2.7";

#endregion