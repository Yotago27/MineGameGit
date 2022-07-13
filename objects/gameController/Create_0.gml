//global tile size
#macro GRID_SIZE 16

mapString = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!@#$%^&*()_-+={[}]|\\:;\"'<,>.?/ 1234567890"
pixelFont = font_add_sprite_ext(sprPixelFont_1,mapString,false,3)
draw_set_font(pixelFont)
pause = false

depth = -190

//easy to use vars
gridWidth = room_width/GRID_SIZE
gridHeight = room_height/GRID_SIZE
//set tile ids for quick access in objects
worldTile = layer_tilemap_get_id("WorldTile")
backgroundTile = layer_tilemap_get_id("BackgroundTile")
//globalSurfaceHeight
surfaceHeight = 10

//create needed instances
instance_create_depth(0,0,0,backgroundTileController)
instance_create_depth(0,0,0,lightingController)
instance_create_depth(0,0,0,skyController)
instance_create_depth(0,0,0,uiController)
instance_create_depth(0,0,0,camController)
instance_create_depth(0,0,0,itemPlaceDrawer)


//collapse code
#region terrian gen



//list of blocks structs
blocks = ds_list_create()
//list of terrian gen data structs
blockGenData = ds_list_create()

	

//block generation struct
function blockGen(_blockID,_startGenHeight,_endGenHeight,_startGenNoise,_endGenNoise,_spawnProbabilty) constructor
{
	blockID = _blockID;
	startGenHeight = _startGenHeight
	endGenHeight = _endGenHeight
	startGenNoise = _startGenNoise
	endGenNoise = _endGenNoise
	spawnProbabilty = _spawnProbabilty
	ds_list_add(gameController.blockGenData,self)
}

// block data struct
function block(_blockID, _name, _hp, _hardness, _value) constructor
{
	blockID = _blockID
	hp = _hp;
	hardness = _hardness;
	name = _name;
	replaceID = _blockID;
	value = _value;
	
	
	ds_list_add(gameController.blocks,self)
	
	
}

//creating blocks

air = new block(0,"Air",0,0,0);
dirt = new block(1,"Dirt",75,1,2);
grass = new block(2,"Grass",50,1,2);
stone = new block(3,"Stone",150,2,5);
coal = new block(4,"Coal",300,2,35);
iron = new block(5,"Iron",500,3,100);
gold = new block(6,"Gold",1000,6,500);
copper = new block(7,"Copper",600,5,125);
tin = new block(8,"Tin",400,4,55);
basalt = new block(9,"Basalt",300,5,10);
ruby = new block(10,"Ruby",2500,8,1000);

//creating terrian gen data

//terrian

tg = new blockGen(grass.blockID,10,10,0,0,1000)
tg = new blockGen(dirt.blockID,11,35,0,50,1000)
tg = new blockGen(stone.blockID,36,200,24,50,1000)
tg = new blockGen(basalt.blockID,201,350,40,50,1000)


//ore

//stone ore
tg = new blockGen(coal.blockID,41,80,27,20,45)
tg = new blockGen(tin.blockID,41,110,27,25,20)
tg = new blockGen(iron.blockID,60,180,20,20,17)
tg = new blockGen(gold.blockID,100,200,20,20,5)
tg = new blockGen(copper.blockID,80,200,10,10,10)
//basalt ore
tg = new blockGen(ruby.blockID,251,320,20,30,5)

//for debug terrain gen time
var oreGenerationTime = current_time;

//////////////////
//create terrain//
//////////////////

//for loops to execute code for each block
for(var yy = 0; yy < gameController.gridHeight; yy++){
	for(var xx = 0; xx < gameController.gridWidth; xx++){
		
		//list of chances for each ore to spawn
		var chanceList = ds_list_create()
		//the total amount of chance every ore has to spawn
		//used to find the random number to generate the terrain
		var chanceTotal = 0;
		
		//list through the blockGenData list to find each ore's spawn chance
		for(var i = 0; i < ds_list_size(blockGenData); i++){
			//set blockGen currently on to var for ease of use
			var cBlockGen = ds_list_find_value(blockGenData,i)
			
			//if ore spawns where the current looked for block is
			if(yy >= (cBlockGen.startGenHeight - random_range(0,cBlockGen.startGenNoise)) and 
			yy <= (cBlockGen.endGenHeight + random_range(0,cBlockGen.endGenNoise))){
				//add spawn probabilty to chanceList and total
				ds_list_add(chanceList,cBlockGen.spawnProbabilty)
				chanceTotal += cBlockGen.spawnProbabilty;
			}
			else{
				ds_list_add(chanceList,0)
			}	
		
		}
		
		//final id of block to place
		var placeBlockid = 0;
		
		//find random number to decide on block
		var r = random_range(0,chanceTotal)
		
		//total of chanceList already run through
		var chanceListCount = 0
		
		for(var i = 0; i < ds_list_size(chanceList); i++){
			//if the random number lands on this blocks spawn probabiltity 
			if(r < ds_list_find_value(chanceList,i) + chanceListCount){
				var b = ds_list_find_value(blockGenData,i)
				placeBlockid = b.blockID
				break
			}
			else{
				//add spawn robility of block to chance list
				chanceListCount += ds_list_find_value(chanceList,i)
			}	
		}
		
		//set tile at point
		tilemap_set(gameController.worldTile,placeBlockid,xx,yy)
	}
}
//debug message the time to make terrian
show_debug_message("generation time: " + string(current_time - oreGenerationTime) + "ms")

#endregion

#region items

invSlots = 10
itemIDCount = 0
invSelectedSlot = 0

function item(_name,_sprite,_maxStack,_objectLinked,_placeable) constructor
{
	name = _name
	sprite = _sprite
	maxStack = _maxStack
	itemID = gameController.itemIDCount
	gameController.itemIDCount += 1
	objectLinked = _objectLinked
	placeable = _placeable
	snapOriginX = -8
	snapOriginY = -8
	canPlaceAboveGround = false
}
function itemSlot(_itemHeld,_amount) constructor
{
	itemHeld = _itemHeld
	amount = _amount
}
function addItem(_item,_amount){
	for(var i = 0; i < invSlots; i++){
		
		if inventory[i].itemHeld = itemNone and _amount > 0 {
			inventory[i].itemHeld = _item
		}
		if inventory[i].itemHeld = _item and _amount > 0{
			var spaceLeft = _item.maxStack - inventory[i].amount
			
			if spaceLeft >= _amount{
				inventory[i].amount += _amount
				_amount = 0
			}	
			else{
				inventory[i].amount += spaceLeft
				_amount -= spaceLeft
			}
		}	
	}
	return _amount
}
function canAddItem(_item){
	
	var total = 0
	
	for(var i = 0; i < invSlots; i++){
		
		if inventory[i].itemHeld = itemNone{
			total += _item.maxStack
		}
		else{
			total += _item.maxStack - inventory[i].amount
		}
	}
	return total
}
function removeItemFromSlot(_slot,_amount){
	gameController.inventory[_slot].amount -= _amount
	var retVal = false
	if gameController.inventory[_slot].amount <= 0{
		if gameController.inventory[_slot].amount == 0 {
			retVal = true	
		}
		else{
			retVal = false	
		}
		
		gameController.inventory[_slot].itemHeld = gameController.itemNone
		gameController.inventory[_slot].amount = 0
	}
	else{
		retVal = true	
	}
	return retVal
}

itemNone = new item("null",pointer_null,0,pointer_null,false)

itemTorch = new item("Torch",sprTorch,10,objTorch,true)
itemLanturn = new item("Lanturn",sprLanturn,10,objLanturn,true)
itemTNT = new item("TNT",sprTNT,10,objTNT,true)

for(var i = 0; i < invSlots; i++){
	inventory[i] = new itemSlot(itemNone,0)
}


#endregion