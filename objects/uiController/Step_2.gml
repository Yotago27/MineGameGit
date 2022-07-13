

if(firstStep == true) or (camController.windowResize == true){
	
	//print("resize")
	#region player ui
	
	firstStep = false;
	guiWidth = camController.windowWidth
	guiHeight = camController.windowHeight

	guiScale = camController.windowWidth/camController.defaultResWidth
	
	guiScaleRounded = 0 //scale for text (rounded)
	guiScaleRoundedSmaller = 0 //scale for text (rounded)
	if guiScale < 1{
		guiScaleRounded = power(2,floor(log2(guiScale)))
	}	
	else{
		guiScaleRounded = ceil(guiScale)
	}	
	if guiScale < 1{
		guiScaleRoundedSmaller = power(2,floor(log2(guiScale)))
	}	
	else{
		guiScaleRoundedSmaller = floor(guiScale)
	}	
	
	
	
	uiLeftOffsetX = 10 * guiScale
	uiLeftOffsetY = 10 * guiScale
	uiRightOffsetX = 10 * guiScale
	uiRightOffsetY = 10 * guiScale

	inventoryCellSize = 100 * guiScale
	inventoryCellOffset = 10 * guiScale
	inventoryCellSpacingX = uiLeftOffsetX
	inventoryCellSpacingY = uiLeftOffsetY
	inventoryCellRad = 10 * guiScale
	inventoryCellColor = c_grey
	inventoryCellColorOutline = c_ltgrey
	inventoryCellColorSelected = c_grey
	inventoryCellColorOutlineSelected = c_yellow
	inventoryCellOutlineThickness = 5 * guiScale
	inventoryCellAlpha = 0.5
	
	inventoryItemSpacing = 6 * guiScale
	inventoryItemNumberSpacingX = 4 * guiScale
	inventoryItemNumberSpacingY = 2 * guiScale
	inventoryItemNumberSize = 2 * guiScaleRoundedSmaller

	oxygenBarSpacingX = uiLeftOffsetX
	oxygenBarSpacingY = (inventoryCellSpacingY + inventoryCellSize + uiLeftOffsetY)// make oxygen bar under inventory
	oxygenBarWidth = 400 * guiScale
	oxygenBarHeight = 50 * guiScale
	oxygenBarColTop = c_blue
	oxygenBarColBottom = c_navy
	oxygenBarColBackgroundColor = c_dkgray
	oxygenBarColOutline = c_ltgray
	oxygenBarColTextColor = c_white
	oxygenBarOutlineThickness = 5 * guiScale
	oxygenBarText = "Oxygen: "
	oxygenBarTextSize = 2 * guiScaleRounded

	healthBarSpacingX = uiLeftOffsetX
	healthBarSpacingY = (inventoryCellSpacingY + inventoryCellSize + uiLeftOffsetY + oxygenBarHeight + uiLeftOffsetY) // make health bar under inventory and oxygen bar
	healthBarWidth = 400 * guiScale
	healthBarHeight = 50 * guiScale
	healthBarColTop = c_red
	healthBarColBottom = c_maroon
	healthBarColBackgroundColor = c_dkgray
	healthBarColOutline = c_ltgray
	healthBarColTextColor = c_white
	healthBarOutlineThickness = oxygenBarOutlineThickness
	healthBarText = "Health: "
	healthBarTextSize = 2 * guiScaleRounded


	moneyCountX = (guiWidth - uiRightOffsetX)
	moneyCountY = uiRightOffsetY * guiScale
	moneySprite = sprMoney
	moneyCountText = "Money:"
	moneyCountSize = 4 * guiScaleRounded
	moneyCountHAlign = ndraw_align_right
	moneyCountVAlign = ndraw_align_top
	moneyCountTextSpacing = 6
	
	#endregion
	
	#region exit screen ui
	exitScreenBackroundColor = c_black
	exitScreenBackroundAlpha = .8
	
	
	exitScreenMenuWidth = (guiWidth/3) 
	exitScreenMenuHeight = (guiHeight*.8)
	exitScreenMenuX = guiWidth/2
	exitScreenMenuY = guiHeight/2
	exitScreenMenuRad = 10 * guiScale
	exitScreenMenuColorBackground = c_dkgray
	exitScreenMenuColorOutline = c_black
	exitScreenMenuOutlineThickness = 5 * guiScale
	
	
	basicButtonWidth = 420 * guiScale
	basicButtonHeight = 64 * guiScale
	basicButtonOffset = 64 * guiScale //offset off top
	basicButtonSpacing = 32 * guiScale //space between controls
	
	
	basicButton.x1 = exitScreenMenuX - (basicButtonWidth/2)
	basicButton.y1 = exitScreenMenuY - (basicButtonHeight/2)
	basicButton.x2 = exitScreenMenuX + (basicButtonWidth/2)
	basicButton.y2 = exitScreenMenuY + (basicButtonHeight/2)
	basicButton.rad = 10 * guiScale
	basicButton.colUp = make_color_rgb(90,90,90)
	basicButton.colHover = c_grey
	basicButton.colDown = c_dkgray
	basicButton.outlineColUp = c_black
	basicButton.outlineColHover = c_black
	basicButton.outlineColDown = c_black
	basicButton.outlineThickness = 5 * guiScale
	basicButton.textHalign = ndraw_align_middle
	basicButton.textValign = ndraw_align_middle
	basicButton.textSize = 2 * guiScaleRounded
	basicButton.textEdgeOffsetY = 10 * guiScale
	basicButton.textOffsetY = 2 * guiScale
	basicButton.text = "add text"
	
	
	
	
	fullscreenButton.copy(basicButton)
	fullscreenButton.y1 = (exitScreenMenuY - (exitScreenMenuHeight/2)) + basicButtonOffset
	fullscreenButton.y2 = fullscreenButton.y1 + basicButtonHeight
	fullscreenButton.text = "Fullscreen"
	
	
	resoultionSelector.x1 = basicButton.x1 
	resoultionSelector.y1 = ((exitScreenMenuY - (exitScreenMenuHeight/2)) + basicButtonOffset) + (1 * (basicButtonHeight + basicButtonSpacing))
	resoultionSelector.x2 = basicButton.x2
	resoultionSelector.y2 = resoultionSelector.y1 + basicButtonHeight
	resoultionSelector.outlineThickness = basicButton.outlineThickness
	
	resoultionSelector.textSize = 2 * guiScaleRoundedSmaller
	
	resoultionSelector.colUp = basicButton.colUp
	resoultionSelector.colHover = basicButton.colHover
	resoultionSelector.outlineColUp = basicButton.outlineColUp
	resoultionSelector.outlineColHover = basicButton.outlineColHover
	resoultionSelector.textColUp = basicButton.textColUp
	resoultionSelector.textColUp = basicButton.textColHover
	
	resoultionSelector.text = "Resoultions "
	
		
	exitButton.copy(basicButton)
	exitButton.y1 = ((exitScreenMenuY - (exitScreenMenuHeight/2)) + basicButtonOffset) + (2 * (basicButtonHeight + basicButtonSpacing))
	exitButton.y2 = exitButton.y1 + basicButtonHeight
	exitButton.text = "Exit Game"
	


	#endregion
	
	#region shop menu
	
	
	
	shopMenuBackroundColor = c_black
	shopMenuBackroundAlpha = .8
	
	shopMenuButtonSpacing = 16 * guiScale
	
	shopMenuButtonOffset = 64 * guiScale
	shopMenuButtonOffsetY = shopMenuButtonOffset * guiScale + basicButtonHeight + shopMenuButtonSpacing
	
	moneyCountShopX = guiWidth/2
	moneyCountShopY = shopMenuButtonOffset
	moneyCountShopHAlign = ndraw_align_center
	moneyCountShopVAlign = ndraw_align_center
	
	shopMenuUpgradeText = "Upgrades"
	shopMenuUpgradeTextX = guiWidth/4
	shopMenuUpgradeTextY = shopMenuButtonOffset
	shopMenuUpgradeTextScale = 4 * guiScaleRounded
	
	shopMenuItemText = "Items"
	shopMenuItemTextX = guiWidth*.75
	shopMenuItemTextY = shopMenuButtonOffset
	shopMenuItemTextScale = 4 * guiScaleRounded
	
	shopMenuButtonWidth = basicButtonWidth*2
	
	for(var i = 0; i < ds_list_size(shop.shopMenuUpgradeButtons);i++){
		var b = ds_list_find_value(shop.shopMenuUpgradeButtons,i)
		b.copy(basicButton)
		b.x1 = guiWidth/4 - (shopMenuButtonWidth/2)
		b.x2 = guiWidth/4 + (shopMenuButtonWidth/2)
		b.y1 = shopMenuButtonOffsetY + ((i * basicButtonHeight) + (i * shopMenuButtonSpacing))
		b.y2 = shopMenuButtonOffsetY + basicButtonHeight + ((i * basicButtonHeight) + (i * shopMenuButtonSpacing))
		b.text = "!no text!"//ds_list_find_value(shopMenuUpgradeButtonNames,i)
		b.textSize = 2 * guiScaleRoundedSmaller

	}	
	
	
	for(var i = 0; i < ds_list_size(shop.shopMenuItemButtons);i++){
		var b = ds_list_find_value(shop.shopMenuItemButtons,i)
		b.copy(basicButton)
		b.x1 = guiWidth*.75 - (shopMenuButtonWidth/2)
		b.x2 = guiWidth*.75 + (shopMenuButtonWidth/2)
		b.y1 = shopMenuButtonOffsetY + ((i * basicButtonHeight) + (i * shopMenuButtonSpacing))
		b.y2 = shopMenuButtonOffsetY + basicButtonHeight + ((i * basicButtonHeight) + (i * shopMenuButtonSpacing))
		b.text = "!no text!"
		b.textSize = 2 * guiScaleRoundedSmaller

	}	
		
	#endregion
}


if exitScreenUp{
	gameController.pause = true
	shop.shopOpen = false
	resoultionSelector.detectInput(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),mouse_check_button(mb_left))
	if resoultionSelector.dropped == false and waitTillMouseRelease = false{
		exitButton.detectInput(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),mouse_check_button(mb_left))
		fullscreenButton.detectInput(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),mouse_check_button(mb_left))
	}
	if resoultionSelector.dropped == true{
		waitTillMouseRelease = true
	}	

	if resoultionSelector.choseOption == true{
		switch resoultionSelector.currentOption{
			case 0:
				sendResW = 960
				sendResH = 540
				break			
			case 1:
				sendResW = 1920
				sendResH = 1080
				break			
			case 2:
				sendResW = 2560
				sendResH = 1440
				break		
			case 3:
				sendResW = 3840
				sendResH = 2160
				break	
		}
		

		with camController{
			setRes(uiController.sendResW,uiController.sendResH,fullscreen)
			
		}			
	}
	if waitTillMouseRelease = true and mouse_check_button(mb_left) == false and resoultionSelector.dropped == false{
		waitTillMouseRelease = false
	}	
	if exitButton.hit == true{
		game_end()
	}	

	if fullscreenButton.hit == true{
	
		if fullscreenSwitchCooldown <= 0 {
			toggleFullscreen = window_get_fullscreen()
			fullscreenSwitchCooldown = 30
		}
		with camController{
			if !uiController.toggleFullscreen{
				setRes(windowWidth,windowHeight,true)
			}
			else{
				setRes(windowWidth,windowHeight,false)
			}
		}		
	}
}


if shop.shopOpen == true{
	gameController.pause = true
	
	
	
	for(var i = 0; i < ds_list_size(shop.shopMenuUpgradeButtons);i++){
		
		var b = ds_list_find_value(shop.shopMenuUpgradeButtons,i)
		
		
		b.detectInput(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),mouse_check_button(mb_left))
		
		var p = ds_list_find_value(shop.shopMenuUpgradeButtonPrices,i)
		var n = ds_list_find_value(shop.shopMenuUpgradeButtonNames,i)
		
		b.text = string(n + string(" - $") + string(p))
		b.textSize = 2 * guiScaleRoundedSmaller
		
		
		if player.money >= p{
			b.colUp = make_color_rgb(40,170,40)
			b.colHover = make_color_rgb(60,190,60)
			b.colDown = make_color_rgb(20,150,20)
			b.outlineColUp = make_color_rgb(40,100,40)
			b.outlineColHover = make_color_rgb(40,100,40)
			b.outlineColDown = make_color_rgb(40,100,40)
		}
		else{
			b.colUp = make_color_rgb(170,40,40)
			b.colHover = make_color_rgb(190,60,60)
			b.colDown = make_color_rgb(150,20,20)
			b.outlineColUp = make_color_rgb(100,40,40)
			b.outlineColHover = make_color_rgb(100,40,40)
			b.outlineColDown = make_color_rgb(100,40,40)
		}	
		
	}
	for(var i = 0; i < ds_list_size(shop.shopMenuItemButtons);i++){
		
		var b = ds_list_find_value(shop.shopMenuItemButtons,i)
		var _item = ds_list_find_value(shop.shopMenuItemButtonItem,i)
		var _itemAmount = ds_list_find_value(shop.shopMenuItemButtonItemAmount,i)
		
		b.detectInput(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),mouse_check_button(mb_left))
		
		var p = ds_list_find_value(shop.shopMenuItemButtonPrices,i)
		var n = ds_list_find_value(shop.shopMenuItemButtonNames,i)
		
		b.text = string(n + string(" - $") + string(p))
		b.textSize = 2 * guiScaleRoundedSmaller
		
		
		print(string(n) + " amount " + string(_itemAmount) + " can add " + string(gameController.canAddItem(_item)) )
		
		if _itemAmount > gameController.canAddItem(_item){
			print("!" + string(n) + "!")	
		}
		
		if player.money < p{
			b.colUp = make_color_rgb(170,40,40)
			b.colHover = make_color_rgb(190,60,60)
			b.colDown = make_color_rgb(150,20,20)
			b.outlineColUp = make_color_rgb(100,40,40)
			b.outlineColHover = make_color_rgb(100,40,40)
			b.outlineColDown = make_color_rgb(100,40,40)
		}
		else if _itemAmount > gameController.canAddItem(_item){
			b.colUp = make_color_rgb(170,170,40)
			b.colHover = make_color_rgb(190,190,60)
			b.colDown = make_color_rgb(150,150,20)
			b.outlineColUp = make_color_rgb(100,100,40)
			b.outlineColHover = make_color_rgb(100,100,40)
			b.outlineColDown = make_color_rgb(100,100,40)
			
		}
		else{
			b.colUp = make_color_rgb(40,170,40)
			b.colHover = make_color_rgb(60,190,60)
			b.colDown = make_color_rgb(20,150,20)
			b.outlineColUp = make_color_rgb(40,100,40)
			b.outlineColHover = make_color_rgb(40,100,40)
			b.outlineColDown = make_color_rgb(40,100,40)

		}	
		
	}

}
	

if !shop.shopOpen and !exitScreenUp{
	gameController.pause = false

}	


fullscreenSwitchCooldown -= 1

