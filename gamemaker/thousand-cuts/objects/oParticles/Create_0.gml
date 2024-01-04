/// @desc Init

// Create particle system
particleSystem = part_system_create();

// Debris particles
particleDebris = part_type_create();
part_type_size(particleDebris,2,4,0,0);
part_type_life(particleDebris,20,20);
part_type_alpha2(particleDebris,1,0);
part_type_direction(particleDebris,0,360,0,0);
part_type_speed(particleDebris,1,2,0,0);