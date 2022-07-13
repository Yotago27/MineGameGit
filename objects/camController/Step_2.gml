
var camScaleW = (windowWidth/cameraWindowRatio) / defaultCameraWidth
var camScaleH = (windowHeight/cameraWindowRatio) / defaultCameraHeight

camWidth = defaultCameraWidth* camScaleW

camHeight = defaultCameraHeight * camScaleH



//set camera position vars
camx = player.x - (camWidth/2)
camy = player.y - (camHeight/2)
//make camera stay in room
camx = clamp(camx,0,room_width-camWidth)
camy = clamp(camy,0,room_height-camHeight)
//set camera pos
camera_set_view_pos(cam,camx,camy)
camera_set_view_size(cam,camWidth,camHeight )


if windowResizeWait <= 0{
	windowResize = false
}	
else{
	windowResize = true	
}

windowResizeWait -= 1
