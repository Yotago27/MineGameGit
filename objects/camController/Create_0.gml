//basic camera control vars
cam = view_camera[0]
defaultCameraWidth = 480 // at 1080p
defaultCameraHeight = 270 // at 1080p
camWidth = defaultCameraWidth
camHeight = defaultCameraHeight
camx = 0
camy = 0

depth = -500

defaultResWidth = 1920
defaultResHeight = 1080

cameraWindowRatioDefault = defaultResWidth/defaultCameraWidth
cameraWindowRatio = cameraWindowRatioDefault

windowWidth = 1920
windowHeight = 1080

windowResizeWait = 0
windowResizeWaitMax = 300
fullscreen = false
windowResize = true

function setRes(_w,_h,_fs){
	//set screen

	if _fs{
		window_set_position(100,100)
	}	
	fullscreen = _fs
	window_set_size(_w,_h)
	
	window_set_fullscreen(_fs)
	
	
	//set view
	view_wport[0] = _w
	view_hport[0] = _h
	//set app surf
	surface_resize(application_surface,_w , _h);
	windowWidth = _w
	windowHeight = _h
	
	if(windowWidth + windowHeight > 1.6 * (defaultResWidth + defaultResHeight)){
		cameraWindowRatio = cameraWindowRatioDefault*2
	}	
	else if (windowWidth + windowHeight >= 1.0 * (defaultResWidth + defaultResHeight)){
		cameraWindowRatio = cameraWindowRatioDefault
	}
	else if(windowWidth + windowHeight < 0.5 * (defaultResWidth + defaultResHeight)){
		cameraWindowRatio = cameraWindowRatioDefault/4
	}	
	else if(windowWidth + windowHeight <= 0.7 * (defaultResWidth + defaultResHeight)){
		cameraWindowRatio = cameraWindowRatioDefault/2
	}	
	
	windowResizeWait = windowResizeWaitMax
	
	
}

setRes(windowWidth,windowHeight,false)