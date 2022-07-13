
if gameController.pause == false{
	//key input vars
	var keyRight = keyboard_check(ord("D"))
	var keyLeft = keyboard_check(ord("A"))
	var keyUp = keyboard_check(ord("W"))
	var keyDown = keyboard_check(ord("S"))

	//where player wants to move next frame
	newMovePosX = 0 
	newMovePosY = 0

	//direction player wants to move
	moveDir = 0

	//set most recent key player hit


	if keyboard_check_pressed(ord("D")){
		mostRecentKey = 1
	}
	else if keyboard_check_pressed(ord("A")){
		mostRecentKey = 2
	}
	else if keyboard_check_pressed(ord("W")){
		mostRecentKey = 3
	}
	else if keyboard_check_pressed(ord("S")){
		mostRecentKey = 4
	}
	else{
		//if holding one key then go that way
		//needed if hit one key and then another and let go of that second key
		if(keyRight + keyLeft + keyUp + keyDown == 1){
			if keyRight{
				mostRecentKey = 1
			}
			if keyLeft{
				mostRecentKey = 2
			}
			if keyUp{
				mostRecentKey = 3
			}
			if keyDown{
				mostRecentKey = 4
			}
		}
	}
	//printVal("mostRec: ",mostRecentKey)
	if keyRight and mostRecentKey = 1 and x < room_width - GRID_SIZE{
		//if hitting right and right is most recent key attempt to move right 
		//with boundery of room
		moveDir = 1
		newMovePosX = GRID_SIZE
		moved = true
	} 
	else if keyLeft and mostRecentKey = 2 and x > 0{
		moveDir = 2
		newMovePosX = -GRID_SIZE
		moved = true
	} 
	else if keyUp and mostRecentKey = 3 and y >= GRID_SIZE * gameController.surfaceHeight{
		moveDir = 3
		newMovePosY = -GRID_SIZE
		moved = true
	} 
	else if keyDown and mostRecentKey = 4 and y < room_height - GRID_SIZE{
		moveDir = 4
		newMovePosY = GRID_SIZE		
		moved = true
	} 

	//cTile is the tile map NUMBER of where the player wants to go
	var cTile = tilemap_get(gameController.worldTile,(x + newMovePosX) /GRID_SIZE,(y + newMovePosY) /GRID_SIZE)

	if(moved == true){
		if(x + newMovePosX != currentMineX) or (y + newMovePosY != currentMineY){
			currentlyMining = false	
		}
		if(cTile = 0){
			if moveTimer <= 0{
				moveTimer = moveTime
				x += newMovePosX
				y += newMovePosY
			}
			currentlyMining = false
		}
		else{
			//blockHit is the block struct of block being hit
			var blockHit = ds_list_find_value(gameController.blocks,cTile)
	
			if(currentlyMining == false){
				//if hitting block and not mining start mining
				currentlyMining = true
				currentBlockHp = blockHit.hp
				currentBLockMaxHp = blockHit.hp
				currentMineX = (x + newMovePosX)
				currentMineY = (y + newMovePosY)
			}
			if(currentlyMining == true and currentBlockHp > 0){
				if(blockHit.hardness <= mineLevel){
					//if minePower is more then do normal damage
					currentBlockHp -= minePower
				
					//show_debug_message(minePower)
				}
				else{
				
					//if minePower is less apply large damage decrease 
					var mineLevelLess = blockHit.hardness - mineLevel
					currentBlockHp -= minePower * (1/(power(mineLevelLess + 1,1.5)))
				
					//show_debug_message(minePower * (1/(power(mineLevelLess + 1,2))))
				}
			}
			if(currentlyMining == true and currentBlockHp <= 0 and moveTimer <= 0){
				//on block destroy (and player can move)
				//destroyBlock
				
				money += blockHit.value
				
				//tilemap_set(gameController.worldTile,0,(x + newMovePosX) /GRID_SIZE,(y + newMovePosY) /GRID_SIZE)
				////add background block
				//tilemap_set(gameController.backgroundTile,blockHit.replaceID,(x + newMovePosX) /GRID_SIZE,(y + newMovePosY) /GRID_SIZE)
				
				TileDestroy((x + newMovePosX) /GRID_SIZE,(y + newMovePosY) /GRID_SIZE)
				
				
				//move
				x += newMovePosX
				y += newMovePosY
				moveTimer = moveTime
				currentlyMining = false
				currentBlockHp = 0
			}
	
	
		}
	
	
	} 


	//oxygen lower if underground and raise if in air


	
	if y >= GRID_SIZE * gameController.surfaceHeight{
		aboveGround = false	
	}
	else{
		aboveGround = true
	}	
	
	


	
	moveTimer -= 1
	moved = false

}

//regen if paused and above ground

if(aboveGround == false){
	if gameController.pause == false{
		if(oxygen <= 0){ 
			hp -= hpTakenUndergroundRate
		}
		else{
			oxygen -= oxygenTakenUndergroundRate
		}
	}
	

}
else{ //regen even if paused
	oxygen += oxygenRegen
	hp += hpRegen
}
//make oxygen/hp not go over or under min and max values
oxygen = clamp(oxygen,0,oxygenMax)

hp = clamp(hp,0,hpMax)