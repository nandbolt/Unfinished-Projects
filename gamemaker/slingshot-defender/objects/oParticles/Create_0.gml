/// @desc Init

// Create particle system
particleSystem = part_system_create();

// Enemy death particles
particlesEnemyDeath = part_type_create();
part_type_size(particlesEnemyDeath,2,4,0,0);
part_type_life(particlesEnemyDeath,45,45);
part_type_alpha2(particlesEnemyDeath,1,0);
part_type_direction(particlesEnemyDeath,0,360,0,0);
part_type_speed(particlesEnemyDeath,1,2,-0.05,0);

// Trail particles
particlesTrail = part_type_create();
part_type_size(particlesTrail,4,4,-0.05,0);
part_type_life(particlesTrail,20,20);
part_type_alpha2(particlesTrail,1,0);

// Stream trail particles
particlesStreamTrail = part_type_create();
part_type_shape(particlesStreamTrail,pt_shape_disk)
part_type_size(particlesStreamTrail,0.1,0.1,-0.01,0);
part_type_life(particlesStreamTrail,10,10);
part_type_alpha2(particlesStreamTrail,1,0);

// Thruster trail particles
particlesThrusterTrail = part_type_create();
part_type_size(particlesThrusterTrail,4,4,-0.05,0);
part_type_life(particlesThrusterTrail,20,20);
part_type_alpha2(particlesThrusterTrail,1,0);
part_type_direction(particlesThrusterTrail,0,360,0,0);
part_type_speed(particlesThrusterTrail,0.5,0.5,-0.05,0);

// Portal particles
particlesPortal = part_type_create();
part_type_size(particlesPortal,2,2,0.1,0);
part_type_life(particlesPortal,120,120);
part_type_alpha2(particlesPortal,1,0);
part_type_direction(particlesPortal,180,180,10,0);
part_type_speed(particlesPortal,1,1,0,0);
part_type_orientation(particlesPortal,0,0,10,0,false);