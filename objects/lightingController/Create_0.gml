//create light surface
lightSurf = surface_create(room_width,room_height)
lightAddSurf = surface_create(room_width,room_height)
//depth of sunlight into ground
sunlightDepth = 10 * GRID_SIZE

depth = -200

lights = ds_list_create()

listPosCounter = 0

function lightAdd(_x,_y,_rad,_col,_brightness,_shine,_flicker) constructor{
	x = _x
	y = _y
	
	realRad = _rad
	rad = _rad
	
	colH = color_get_hue(_col)
	
	colS = color_get_saturation(_col)
	
	shine = _shine
	
	shineRadMultiplier = .75
	
	brightness = _brightness
	
	flicker = _flicker
	
	shineCol = make_color_hsv(colH,colS,shine * 255)

	col = make_color_hsv(colH,colS,brightness * 255)
	
	ds_list_add(lightingController.lights,self)
	listPos = lightingController.listPosCounter
	lightingController.listPosCounter += 1
	
	
	function update(){
		rad = realRad + random_range(0,flicker)
	}	
}

