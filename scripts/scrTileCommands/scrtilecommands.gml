function TileDestroyRectangle(x1,x2,y1,y2){
	
	var rectW = abs(x1 - x2)
	var rectH = abs(y1 - y2)
	
	for(var xx = 0;xx < rectW; xx++){
		for(var yy = 0;yy < rectH; yy++){
			TileDestroy(xx,yy)
		}
	}
	
	
}

function TileDestroy(tileX,tileY){
	var cTile = tilemap_get(gameController.worldTile,tileX,tileY)
	var blockHit = ds_list_find_value(gameController.blocks,cTile)
	show_debug_message(blockHit)
	tilemap_set(gameController.worldTile,0,tileX,tileY)
	tilemap_set(gameController.backgroundTile,blockHit.replaceID,tileX, tileY)
}

function TileDestroyCircle(xx,yy,rad){
	
	
}