draw_set_circle_precision(32)
//stops crashing when alt-tabing
if (!surface_exists(lightSurf)) {
    lightSurf = surface_create(room_width,room_height)
}
if (!surface_exists(lightAddSurf)) {
    lightAddSurf = surface_create(room_width,room_height)
}
//draw on the light surface
surface_set_target(lightSurf)
//make light surface start out black (white == black in subrtactive belnding)
draw_clear_alpha(c_white,1)

//surface height in pixels
var surfH = GRID_SIZE * gameController.surfaceHeight
//draw non ground light
draw_set_color(c_black)
draw_rectangle(0,0,room_width,surfH,false)
draw_set_color(c_white)


draw_set_color(c_black)
draw_rectangle(0,0,room_width,surfH,false)
draw_set_color(c_white)



//draw sunlight into ground
draw_rectangle_color(0,surfH,room_width,surfH + sunlightDepth,c_black,c_black,c_white,c_white,false)

//make simple light around player


//draw_circle_colour(player.x, player.y, 160,c_yellow, c_black, false);

gpu_set_blendmode(bm_subtract)

for(var i = 0; i < ds_list_size(lights);i++){
	var li = ds_list_find_value(lights,i)
	
	draw_circle_colour(li.x, li.y, li.rad,li.col, c_black, false);

	
}
gpu_set_blendmode(bm_normal)


surface_reset_target()


#region add light surf

surface_set_target(lightAddSurf)

draw_clear_alpha(c_black,1)

gpu_set_blendmode(bm_add)
//draw_circle_colour(player.x, player.y, 160,c_yellow, c_black, false);

for(var i = 0; i < ds_list_size(lights);i++){
	var li = ds_list_find_value(lights,i)

	draw_circle_colour(li.x, li.y, li.rad * li.shineRadMultiplier,li.shineCol, c_black, false);

	
}
#endregion


surface_reset_target()







//draw light surface in bm subtract
gpu_set_blendmode(bm_subtract)
draw_surface_ext(lightSurf,0,0,1,1,0,c_white,1)

gpu_set_blendmode(bm_add)
draw_surface_ext(lightAddSurf,0,0,1,1,0,c_white,1)
gpu_set_blendmode(bm_normal)