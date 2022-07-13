
if shopOpen == false{
	if keyboard_check_pressed(shopOpenKey) and abs(player.x - x) <= shopOpenDistance and player.aboveGround = true{
		shopOpen = true
		
	}	

}
else{
	if keyboard_check_pressed(shopOpenKey){
		shopOpen = false
		
	}	
		
}



for(var i = 0; i < ds_list_size(shopMenuUpgradeButtons); i++){
	var b = ds_list_find_value(shopMenuUpgradeButtons,i)
	var n = ds_list_find_value(shopMenuUpgradeButtonNames,i)
	var p = ds_list_find_value(shopMenuUpgradeButtonPrices,i)
	if b.hit == true{
			
		if p <= player.money{
			
			player.money -= p
			
			switch i{
				case 0:
					player.oxygenMax += 10
					var price = ds_list_find_value(shopMenuUpgradeButtonPrices,i)
					ds_list_set(shopMenuUpgradeButtonPrices,i,ceil(price * 1.12))
					break
				case 1:
					player.hpMax += 12
					var price = ds_list_find_value(shopMenuUpgradeButtonPrices,i)
					ds_list_set(shopMenuUpgradeButtonPrices,i,ceil(price * 1.1))
					break
				case 2:
					var price = ds_list_find_value(shopMenuUpgradeButtonPrices,i)
					ds_list_set(shopMenuUpgradeButtonPrices,i,ceil(price * 1.45))
					player.moveTime *= 1/1.05
					break
				case 3:
					var price = ds_list_find_value(shopMenuUpgradeButtonPrices,i)
					ds_list_set(shopMenuUpgradeButtonPrices,i,ceil(price * 1.1))
					player.oxygenRegen += 1/60
					break
				case 4:
					var price = ds_list_find_value(shopMenuUpgradeButtonPrices,i)
					ds_list_set(shopMenuUpgradeButtonPrices,i,ceil(price * 1.1))
					player.hpRegen += 0.75/60
					break
				case 5:
					var price = ds_list_find_value(shopMenuUpgradeButtonPrices,i)
					ds_list_set(shopMenuUpgradeButtonPrices,i,ceil(price * 1.17))
					player.minePower *= 1.1
					break
				case 6:
					var price = ds_list_find_value(shopMenuUpgradeButtonPrices,i)
					ds_list_set(shopMenuUpgradeButtonPrices,i,ceil(price * 1.75))
					player.mineLevel += 1
					break
			
			}

		}

	}
}	
for(var i = 0; i < ds_list_size(shopMenuItemButtons); i++){
	var b = ds_list_find_value(shopMenuItemButtons,i)
	var n = ds_list_find_value(shopMenuItemButtonNames,i)
	var p = ds_list_find_value(shopMenuItemButtonPrices,i)
	var _item = ds_list_find_value(shop.shopMenuItemButtonItem,i)
	var _itemAmount = ds_list_find_value(shop.shopMenuItemButtonItemAmount,i)
	if b.hit == true{
			
		if p <= player.money and _itemAmount <= gameController.canAddItem(_item){
			
			player.money -= p
			
			gameController.addItem(_item,_itemAmount)
			
		}

	}

}
	