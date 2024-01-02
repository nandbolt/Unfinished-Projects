/// @desc Init

// Particle system
psystem = part_system_create();

// Generic particles
ptype_generic = part_type_create();
part_type_direction(ptype_generic,0,360,0,0);
part_type_speed(ptype_generic,0.1,0.5,0,0);
part_type_shape(ptype_generic,pt_shape_pixel);
part_type_life(ptype_generic,30,30);
part_type_alpha2(ptype_generic,1,0);