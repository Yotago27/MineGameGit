for(var i = 0; i < invSlots;i++){
	if i = 0 {
		if invSlots >= 10 and keyboard_check_pressed(ord("0")){
			invSelectedSlot = 9
		}	
	}
	else{
		if(keyboard_check_pressed(ord(string(i)))){
			invSelectedSlot = i - 1
			//print(i)
		}
	}
}	
if mouse_wheel_down(){
	invSelectedSlot++
	if invSelectedSlot >= invSlots{
		invSelectedSlot = 0
	}	
}	
if mouse_wheel_up(){
	invSelectedSlot--
	if invSelectedSlot < 0{
		invSelectedSlot = invSlots - 1
	}	
}	

var ci = inventory[invSelectedSlot].itemHeld

if ci.placeable == true{

	
	var cx = (round((mouse_x-ci.snapOriginX)/16)*16) + ci.snapOriginX
	var cy = (round((mouse_y - ci.snapOriginY)/16)*16) + ci.snapOriginY

	var cTile = tilemap_get_at_pixel(gameController.worldTile,cx,cy)

	if cTile == 0 and !collision_point(cx,cy,placeableParent,false,false) and mouse_check_button_pressed(mb_left){
		if ci.canPlaceAboveGround == true or ci.canPlaceAboveGround == false and cy >= gameController.surfaceHeight * GRID_SIZE{
			instance_create_depth(cx,cy,0,ci.objectLinked)
			removeItemFromSlot(invSelectedSlot,1)
		}
		
	}
}