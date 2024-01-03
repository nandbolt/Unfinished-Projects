/// @desc Init

// Create particle system
part_system = part_system_create();

// Airburst particles
part_type_airburst = part_type_create();
part_type_sprite(part_type_airburst,sPartAirburst,true,true,false);
part_type_speed(part_type_airburst,0.1,0.2,0,0);
part_type_direction(part_type_airburst,270,270,0,0);
part_type_life(part_type_airburst,45,45);
part_type_alpha2(part_type_airburst,1,0);

// Debris particles
part_type_debris = part_type_create();
part_type_shape(part_type_debris,pt_shape_pixel);
part_type_size(part_type_debris,2,4,-0.05,0.5);
part_type_orientation(part_type_debris,0,360,0,5,0);
part_type_speed(part_type_debris,0.5,1,0,0);
part_type_direction(part_type_debris,20,160,0,0);
part_type_gravity(part_type_debris,0.05,270);
part_type_alpha2(part_type_debris,1,0);
part_type_life(part_type_debris,30,30);

// Wind trail particles
part_type_windtrail = part_type_create();
part_type_size(part_type_windtrail,8,8,-0.1,0);
part_type_alpha2(part_type_windtrail,1,0);
part_type_life(part_type_windtrail,10,10);