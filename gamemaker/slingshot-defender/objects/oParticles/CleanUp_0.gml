/// @desc Free Memory

// Destroy particles
part_type_destroy(particlesEnemyDeath);
part_type_destroy(particlesTrail);
part_type_destroy(particlesStreamTrail);
part_type_destroy(particlesThrusterTrail);
part_type_destroy(particlesPortal);

// Destroy particle system
part_system_destroy(particleSystem);