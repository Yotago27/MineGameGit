var ci = gameController.inventory[gameController.invSelectedSlot].itemHeld

if ci.placeable == true{
	var cx = (round((mouse_x-ci.snapOriginX)/16)*16) + ci.snapOriginX
	var cy = (round((mouse_y - ci.snapOriginY)/16)*16) + ci.snapOriginY

	var cTile = tilemap_get_at_pixel(gameController.worldTile,cx,cy)

	if cTile == 0 and !collision_point(cx,cy,placeableParent,false,false){
		if ci.canPlaceAboveGround == true or ci.canPlaceAboveGround == false and cy >= gameController.surfaceHeight * GRID_SIZE{
			shader_set(shdrPlace)

			draw_sprite_ext(ci.sprite,0,cx,cy,1,1,0,c_white,1)

			shader_reset()
		}

	}
}