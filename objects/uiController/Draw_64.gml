
#region player ui
/////draw inventory cells

for(var i = 0; i < gameController.invSlots; i++){
	draw_set_alpha(inventoryCellAlpha)
	if i != gameController.invSelectedSlot{
		ndraw_roundrect_ext_outline(
		inventoryCellSpacingX + (i*(inventoryCellOffset + inventoryCellSize)),												//x1
		inventoryCellSpacingY,																								//y1
		(inventoryCellSpacingX + inventoryCellSize) + (i*(inventoryCellOffset + inventoryCellSize)),						//x2
		(inventoryCellSpacingY + inventoryCellSize),																		//y2
		inventoryCellRad,inventoryCellRad,inventoryCellColor,inventoryCellColorOutline,inventoryCellOutlineThickness)		//color ect
	}
	else{
		ndraw_roundrect_ext_outline(
		inventoryCellSpacingX + (i*(inventoryCellOffset + inventoryCellSize)),												//x1
		inventoryCellSpacingY,																								//y1
		(inventoryCellSpacingX + inventoryCellSize) + (i*(inventoryCellOffset + inventoryCellSize)),						//x2
		(inventoryCellSpacingY + inventoryCellSize),																		//y2
		inventoryCellRad,inventoryCellRad,inventoryCellColorSelected,inventoryCellColorOutlineSelected,inventoryCellOutlineThickness)		//color ect	
	}
	draw_set_alpha(1)
	
	var ispr = gameController.inventory[i].itemHeld.sprite
	
	if ispr != pointer_null{
		
		var xx = inventoryCellSpacingX + (i*(inventoryCellOffset + inventoryCellSize)) + (inventoryCellSize/2)
		var yy = inventoryCellSpacingY + (inventoryCellSize/2)
		var w = abs((inventoryItemSpacing * 2) - inventoryCellSize)
		draw_sprite_ext(ispr,0,xx,yy,w/sprite_get_width(ispr),w/sprite_get_height(ispr),-22.5,c_white,1)
	}
	draw_set_halign(fa_left)
	draw_set_valign(fa_bottom)
	if gameController.inventory[i].itemHeld != gameController.itemNone{
		draw_text_transformed(
		inventoryCellSpacingX + (i*(inventoryCellOffset + inventoryCellSize)) + inventoryItemNumberSpacingX + inventoryCellOutlineThickness,
		(inventoryCellSpacingY + inventoryCellSize) - (inventoryItemNumberSpacingY + inventoryCellOutlineThickness),
		string(gameController.inventory[i].amount) + "/" + string(gameController.inventory[i].itemHeld.maxStack),
		inventoryItemNumberSize,inventoryItemNumberSize,0
		)
	}	
	
	
} 
////draw oxygen bar
ndraw_heathbar_ext(
oxygenBarSpacingX,oxygenBarSpacingY,oxygenBarSpacingX + oxygenBarWidth,oxygenBarSpacingY + oxygenBarHeight,				//x1,y1,x2,y2
oxygenBarColTop,oxygenBarColBottom,oxygenBarColBackgroundColor,oxygenBarColOutline,oxygenBarColTextColor,				//colors
oxygenBarOutlineThickness,player.oxygen,player.oxygenMax,ndraw_show_number_rounded,oxygenBarText,oxygenBarTextSize		//other
)   

////draw hp bar
ndraw_heathbar_ext(
healthBarSpacingX,healthBarSpacingY,healthBarSpacingX + healthBarWidth,healthBarSpacingY + healthBarHeight,				//x1,y1,x2,y2
healthBarColTop,healthBarColBottom,healthBarColBackgroundColor,healthBarColOutline,healthBarColTextColor,				//colors
healthBarOutlineThickness,player.hp,player.hpMax,ndraw_show_number_rounded,healthBarText,healthBarTextSize		//other
)   

ndraw_text_icon(moneyCountX,moneyCountY,
moneyCountText,player.money,moneyCountSize,
moneySprite,moneyCountSize,
moneyCountHAlign,moneyCountVAlign,moneyCountTextSpacing
)
#endregion
#region exit menu
if exitScreenUp{
	
	draw_set_color(exitScreenBackroundColor)
	draw_set_alpha(exitScreenBackroundAlpha)
	draw_rectangle(0,0,guiWidth,guiHeight,false)
	
	ndraw_roundrect_ext_outline(
	exitScreenMenuX - (exitScreenMenuWidth/2),
	exitScreenMenuY - (exitScreenMenuHeight/2),
	exitScreenMenuX + (exitScreenMenuWidth/2),
	exitScreenMenuY + (exitScreenMenuHeight/2),
	exitScreenMenuRad, exitScreenMenuRad,
	exitScreenMenuColorBackground,
	exitScreenMenuColorOutline,
	exitScreenMenuOutlineThickness
	)

	
	fullscreenButton.ndraw()
	exitButton.ndraw()
	resoultionSelector.ndraw()
	

}
#endregion
#region shop menu
if shop.shopOpen == true{
	draw_set_color(shopMenuBackroundColor)
	draw_set_alpha(shopMenuBackroundAlpha)
	draw_rectangle(0,0,guiWidth,guiHeight,false)
	ndraw_reset()
	
	draw_text_ext_transformed(shopMenuUpgradeTextX,shopMenuUpgradeTextY,shopMenuUpgradeText,0,100000,shopMenuUpgradeTextScale,shopMenuUpgradeTextScale,0)
	draw_text_ext_transformed(shopMenuItemTextX,shopMenuItemTextY,shopMenuItemText,0,100000,shopMenuItemTextScale,shopMenuItemTextScale,0)
	
	for(var i = 0; i < ds_list_size(shop.shopMenuUpgradeButtons);i++){
		var b = ds_list_find_value(shop.shopMenuUpgradeButtons,i)
		b.ndraw()
	}
	for(var i = 0; i < ds_list_size(shop.shopMenuItemButtons);i++){
		var b = ds_list_find_value(shop.shopMenuItemButtons,i)
		b.ndraw()
	}
	
	ndraw_text_icon(moneyCountShopX,moneyCountShopY,
	moneyCountText,player.money,moneyCountSize,
	moneySprite,moneyCountSize,
	moneyCountShopHAlign,moneyCountShopVAlign,moneyCountTextSpacing
	)
	
}
#endregion

