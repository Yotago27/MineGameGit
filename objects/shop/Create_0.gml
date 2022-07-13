depth = -75
shopOpen = false
shopOpenKey = ord("E")
shopOpenDistance = 48

#region item lists

shopMenuItemButtons = ds_list_create()

shopMenuItemButtonNames = ds_list_create()

shopMenuItemButtonPrices = ds_list_create()

shopMenuItemButtonItem = ds_list_create()

shopMenuItemButtonItemAmount = ds_list_create()
#endregion

#region upgrade lists

shopMenuUpgradeButtons = ds_list_create()

shopMenuUpgradeButtonNames = ds_list_create()

shopMenuUpgradeButtonPrices = ds_list_create()


#endregion



function addUpgradeButton(name,price){
	ds_list_add(shopMenuUpgradeButtons, new nbutton())
	ds_list_add(shopMenuUpgradeButtonNames ,name)
	ds_list_add(shopMenuUpgradeButtonPrices , price)
}

function addItemButton(name,price,_item,_amount){
	ds_list_add(shopMenuItemButtons, new nbutton())
	ds_list_add(shopMenuItemButtonNames ,name)
	ds_list_add(shopMenuItemButtonPrices ,price)
	ds_list_add(shopMenuItemButtonItem, _item)
	ds_list_add(shopMenuItemButtonItemAmount, _amount)
}


addUpgradeButton("Oxygen(+10)",5)
addUpgradeButton("Health(+12)",5)
addUpgradeButton("Move Speed(+5%)",10)
addUpgradeButton("Oxygen Regen(1 point per sec)",5)
addUpgradeButton("HP Regen(0.75 point per sec)",5)
addUpgradeButton("Mine Speed(+10%)",15)
addUpgradeButton("Mine Level(+1)",50)



addItemButton("Torch",5,gameController.itemTorch,1)
addItemButton("Lantern",15,gameController.itemLanturn,1)
addItemButton("Bomb",250,gameController.itemTorch,10)
addItemButton("TNT",500,gameController.itemTNT,1)






shopMenuOpenText = "Press 'E' to open"