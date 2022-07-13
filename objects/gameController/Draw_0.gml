if player.currentlyMining == true {
	var mIndex = ((player.currentBlockHp/player.currentBLockMaxHp * sprite_get_number(sprMineAnimation)) - sprite_get_number(sprMineAnimation)) *-1
	draw_sprite(sprMineAnimation,mIndex,player.currentMineX,player.currentMineY)
	
}

