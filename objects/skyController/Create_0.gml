depth = -10
//create cloud part system
psCloud = part_system_create()
ptCloud = part_type_create()
peCloud = part_emitter_create(psCloud)

part_system_depth(psCloud,-140)
part_emitter_burst(psCloud,peCloud,ptCloud,600)

part_emitter_region(psCloud,peCloud,0,room_width,0,7 * GRID_SIZE,ps_shape_rectangle,ps_distr_linear)

part_type_sprite(ptCloud,sprCloud,false,false,true)
part_type_alpha3(ptCloud,0,0.5,0)
part_type_life(ptCloud,600,1800)
part_type_speed(ptCloud,0.1,0.3,-0.001,0.01)
part_type_size(ptCloud,0.75,1.5,0,0)