// Player
enum PlayerState
{
	IDLE,
	RUN,
	JUMP,
	FALL,
	WALLCLING,
	DASH,
	FLIP
}

// Inputs
enum Input
{
	LEFT,
	RIGHT,
	DOWN,
	JUMP_PRESSED,
	JUMP_RELEASED,
	INTERACT_PRESSED,
	PAUSE,
	SELECT,
	FULLSCREEN,
	MUTE,
	RESTART
}

// Coin
enum CollectableState
{
	INACTIVE,
	ACTIVE,
	COLLECTED
}

// Game Modes
enum GameMode
{
	COLLECT20,
	COLLECT50,
	ZEN,
	COLLECTTRAIL
}