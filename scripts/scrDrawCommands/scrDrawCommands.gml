#macro ndraw_show_none 0 
#macro ndraw_show_number 1
#macro ndraw_show_percent 2
#macro ndraw_show_number_rounded 3

#macro ndraw_align_left 0
#macro ndraw_align_center 1
#macro ndraw_align_right 2

#macro ndraw_align_top 0
#macro ndraw_align_middle 1
#macro ndraw_align_bottom 2

#macro nbutton_state_up 0
#macro nbutton_state_hover 1
#macro nbutton_state_down 2


function ndraw_heathbar_ext(x1,y1,x2,y2,col1,col2,backgroundColor,outlineColor,textColor,outlineThickness,val,maxVal,showNumber,stringShow,textSize){
	draw_set_color(outlineColor)
	draw_rectangle(x1,y1,x2,y2,false)
	draw_set_color(backgroundColor)
	draw_rectangle(x1 + outlineThickness,y1 + outlineThickness,x2 - outlineThickness,y2 - outlineThickness,false)
	var amountFull = val/maxVal
	var width = abs((x1 + outlineThickness) - (x2 - outlineThickness))
	var height = abs((y1 + outlineThickness) - (y2 - outlineThickness))
	draw_rectangle_color(x1 + outlineThickness,y1 + outlineThickness,x1 + outlineThickness + (width * amountFull),y2 - outlineThickness,col1,col1,col2,col2,false)
	draw_set_color(textColor)
	draw_set_halign(fa_left)
	draw_set_valign(fa_center)
	if(showNumber == ndraw_show_none){
		draw_text_transformed((x1 + outlineThickness) + (outlineThickness),(y1 + outlineThickness) + (height/2),string(stringShow),textSize,textSize,0)
	}	
	if(showNumber == ndraw_show_number){
		draw_text_transformed((x1 + outlineThickness) + (outlineThickness),(y1 + outlineThickness) + (height/2),string(stringShow) + string(val) + "/" + string(maxVal),textSize,textSize,0)
	}
	if(showNumber == ndraw_show_percent){
		var percent = round(amountFull * 100)
		draw_text_transformed((x1 + outlineThickness) + (outlineThickness),(y1 + outlineThickness) + (height/2),string(stringShow) + string(percent) + "%",textSize,textSize,0)
	}
	if(showNumber == ndraw_show_number_rounded){
		draw_text_transformed((x1 + outlineThickness) + (outlineThickness),(y1 + outlineThickness) + (height/2),string(stringShow) + string(round(val)) + "/" + string(round(maxVal)),textSize,textSize,0)
	}
	draw_set_color(c_white)
}

function ndraw_roundrect_ext_outline(x1,y1,x2,y2,radx,rady,col,outlineCol,outlineThickness){
	draw_set_color(outlineCol)
	draw_roundrect_ext(x1,y1,x2,y2,radx,rady,false)
	draw_set_color(col)
	draw_roundrect_ext(x1 + outlineThickness,y1 + outlineThickness,x2 - outlineThickness,y2 - outlineThickness,radx,rady,false)
	draw_set_color(c_white)
}	
//val is optional
function ndraw_text_icon(x,y,text,val,textSize,spr,sprSize,alignH,alignV,textSpacing){
	//assumes center orgin on sprite
	var sprWidth = sprite_get_width(spr)
	var sprHeight = sprite_get_height(spr)
	var sprXoffset = 0
	var sprYoffset = 0
	var textXoffset = 0
	var textYoffset = 0
	
	if alignH = ndraw_align_left{
		sprXoffset = (sprWidth/2)
		draw_set_halign(fa_left)
		textXoffset = sprWidth + textSpacing
	}
	if alignH = ndraw_align_right{
		sprXoffset = -1 * (sprWidth/2)
		draw_set_halign(fa_right)
		textXoffset = ((sprWidth/2) * -1) - textSpacing
	}
	if alignH = ndraw_align_center{
		var totalWidth = (string_width(string(text) + string(val))) + (sprWidth) + textSpacing
		draw_set_halign(fa_right)
		textXoffset = totalWidth/2
		sprXoffset = -(totalWidth/2) + (sprWidth/2)
	}
	
	//text always center aligned vertically 

	
	if alignV = ndraw_align_top{
		sprYoffset = sprHeight/2
		textYoffset = sprYoffset
	}
	if alignV = ndraw_align_bottom{
		sprYoffset = -1 * (sprHeight /2)
		textYoffset = sprYoffset
	}
	if alignV = ndraw_align_middle{
		sprYoffset = 0
		textYoffset = sprYoffset
	}
	
	
	
	draw_sprite_ext(spr,0,
	x + (sprXoffset * sprSize),
	y + (sprYoffset * sprSize),
	sprSize,sprSize
	,0,c_white,1)
	
	draw_text_transformed(
	x + (textXoffset * textSize),
	y + (textYoffset * textSize),
	string(text) + string(val),
	textSize,
	textSize,
	0
	)
	
	//draw origin 
	//draw_circle(x,y,4,false)
	
}

function ndraw_reset(){
	draw_set_color(c_white)
	draw_set_alpha(1)
	draw_set_halign(fa_center)
	
}

function nbutton()  constructor{
	//too many things to add in constructor > 16 arguments
	x1 = 10
	y1 = 10
	x2 = 110//unused with sprite
	y2 = 110//unused with sprite
	
	rad = 0
	outlineThickness = 1
	
	//color of bg on non sprite color of sprite if there is sprite
	colUp = c_white
	colDown = c_white
	colHover = c_white
	
	outlineColUp = c_dkgrey
	outlineColDown = c_dkgrey
	outlineColHover = c_dkgrey
	
	textColUp = c_black
	textColDown = c_black
	textColHover = c_black
	
	/////////////////////////////////////////////////////////////
	//!!!! assumes default aligned (top left) sprite orgin!!!!///
	/////////////////////////////////////////////////////////////
	sprite = pointer_null
	
	spriteXScale = 1
	spriteYScale = 1
	text = "Add text"
	textHalign = ndraw_align_center
	textValign = ndraw_align_middle
	
	textEdgeOffsetAuto = true //make text offset automaticlly look the same for both sides x and y
	
	textEdgeOffsetX = 0 //if aligned non center how far from edge
	textEdgeOffsetY = 0 //if aligned non center how far from edge
	textSize = 1
	textHitOffsetX = 0
	textHitOffsetY = 4
	textOffsetX = 0
	textOffsetY = 0
	drawText = true
	
	canHold = false
	
	hit = false
	
	state = nbutton_state_up
	
	alpha = 1
	
	isHeld = false
	
	function copy(i){
		x1 = i.x1
		y1 = i.y1
		x2 = i.x2
		y2 = i.y2
		rad = i.rad
		outlineThickness = i.outlineThickness
		colUp = i.colUp
		colDown = i.colDown
		colHover = i.colHover
		outlineColUp = i.outlineColUp
		outlineColDown = i.outlineColDown 
		outlineColHover = i.outlineColHover
		textColUp = i.textColUp
		textColDown = i.textColDown 
		textColHover = i.textColHover
		sprite = i.sprite
		spriteXScale = i.spriteXScale
		spriteYScale = i.spriteYScale
		text = i.text
		textHalign = i.textHalign
		textValign = i.textValign
		textEdgeOffsetAuto = i.textEdgeOffsetAuto
		textEdgeOffsetX = i.textEdgeOffsetX
		textEdgeOffsetY = i.textEdgeOffsetY
		textSize = i.textSize
		textHitOffsetX = i.textHitOffsetX
		textHitOffsetY = i.textHitOffsetY
		textOffsetX = i.textOffsetX
		textOffsetY = i.textOffsetY
		drawText = i.drawText
		canHold = i.canHold
		state = i.state 
		alpha = i.alpha
		isHeld = i.isHeld
	}	
	
	function nbuttonSpriteWidth(){
		if sprite != pointer_null{
			return sprite_get_width(sprite) * spriteXScale
		}
		else{
			print_val("call spr width no sprite ",sprite)
			return 0
		}	
	}	
	
	function nbuttonSpriteHeight(){
		if sprite != pointer_null{
			return sprite_get_height(sprite) * spriteYScale
		}
		else{
			print_val("call spr height no sprite ",sprite)
			return 0
		}	
	}	
	
	function detectInput(mx,my,input){
		
		var hitBoxX2 = x2
		var hitBoxY2 = y2
		
		hit = false
		

		//if sprite make bounder different
		if sprite != pointer_null{
			hitBoxX2 = x1 + nbuttonSpriteWidth()
			hitBoxY2 = y1 + nbuttonSpriteHeight()
		}
		
		if point_in_rectangle(mx,my,x1,y1,hitBoxX2,hitBoxY2){
			if input == true{
				state = nbutton_state_down
				if canHold == true{
					hit = true
					
				}
				else{
					if isHeld == false{
						
						hit = true
						isHeld = true
					}	
						
				}
			}
			else{
				
				state = nbutton_state_hover
				isHeld = false
			}
		}	
		else{
			state = nbutton_state_up
			isHeld = false
		}	
				
		
			
	}
		
	function autoTextOffset(){

		var rY2 = y2
		
		if sprite != pointer_null{
			rY2 = y1 + nbuttonSpriteHeight()
		}
			
		var height =  abs(rY2 - y1)
			
		var spaceV = height - (string_height(text) * textSize)
		
		
		textEdgeOffsetX = spaceV/4
	}
	
	function ndraw(){

		
		//change colors based on if pressed
		var colCurrent = c_white
		var outlineColCurrent = c_white
		switch state{
			case nbutton_state_up:
				colCurrent = colUp
				outlineColCurrent = outlineColUp
				break
			case nbutton_state_hover:
				colCurrent = colHover
				outlineColCurrent = outlineColHover
				break
			case nbutton_state_down:
				colCurrent = colDown
				outlineColCurrent = outlineColDown
				break
			default:
				print_val("error drawing button! button state - ",state)
				break		
		}
		
		
		
		if (sprite != pointer_null){ // if sprite exists for button
			draw_sprite_ext(sprite,0,x1,y1,spriteXScale,spriteYScale,0,colCurrent,alpha)
		}
		else{ //if there is no sprite draw round rect
			ndraw_roundrect_ext_outline(x1,y1,x2,y2,rad,rad,colCurrent,outlineColCurrent,outlineThickness)
		}
		
		if drawText == true{
			
			
			var rX2 = x2
			var rY2 = y2
		

			//if sprite make bounder different
			if sprite != pointer_null{
				rX2 = x1 + nbuttonSpriteWidth()
				rY2 = y1 + nbuttonSpriteHeight()
			}
			
			
			
			var width = abs(rX2 - x1)
			var height =  abs(rY2 - y1)
			

			
			var drawTextX = x1
			var drawTextY = y1
			
			var currentTextCol = c_white
			
			if textEdgeOffsetAuto == true{
				autoTextOffset()
			}	
			
			switch textHalign{
				
				case ndraw_align_left:
					drawTextX = x1 + textEdgeOffsetX
					draw_set_halign(fa_left)
					break;
				case ndraw_align_center:
					drawTextX = x1 + (width/2)
					draw_set_halign(fa_center)
					break;		
				case ndraw_align_right:
					drawTextX = rX2 - textEdgeOffsetX
					draw_set_halign(fa_right)
					break;
				default:
					print_val("error halign on button! button state - ",state)
					break;
			}
			switch textValign{
				
				case ndraw_align_top:
					drawTextY = y1 + textEdgeOffsetY
					draw_set_valign(fa_top)
					break;
				case ndraw_align_middle:
					drawTextY = y1 + (height/2)
					draw_set_valign(fa_center)
					break;
				case ndraw_align_bottom:
					drawTextY = rY2 - textEdgeOffsetY
					draw_set_valign(fa_bottom)
					break;
				default:
					print_val("error valign on button! button state - ",state)
					break;
			}		
			
			if state == nbutton_state_down{
				drawTextX += textHitOffsetX
				drawTextY += textHitOffsetY
			}
			
			drawTextX += textOffsetX
			drawTextY += textOffsetY
			
			switch state{
				
				case nbutton_state_up:
					currentTextCol = textColUp
					break;
				case nbutton_state_hover:
					currentTextCol = textColHover
					break;
				case nbutton_state_down:
					currentTextCol = textColDown
					break;
				default:
					draw_set_color(c_red)
					print_val("error drawing text color on button! button state - ",state)
					break;
			}			
			
			//draw_set_color(c_red)
			//draw_circle(drawTextX,drawTextY,1,false)
			

			
			draw_text_transformed_color(drawTextX,drawTextY,text,textSize,textSize,0,currentTextCol,currentTextCol,currentTextCol,currentTextCol,alpha)
			
		}
		
	}	
}

function nselector()  constructor{
	x1 = 10
	y1 = 10
	x2 = 110
	y2 = 110
	
	rad = 0

	colUp = c_white
	colHover = c_white
	
	outlineColUp = c_dkgrey
	outlineColHover = c_dkgrey
	
	textColUp = c_black
	textColHover = c_black
	
	outlineThickness = 5


	text = "Add text"
	textHalign = ndraw_align_center
	textValign = ndraw_align_middle
	
	options = ds_list_create()
	currentOption = 0
	currentOptionHover = 0
	dropped = false
	
	textEdgeOffsetAuto = true //make text offset automaticlly look the same for both sides x and y
	
	textEdgeOffsetX = 0 //if aligned non center how far from edge
	textEdgeOffsetY = 0 //if aligned non center how far from edge
	textSize = 1
	textHitOffsetX = 0
	textHitOffsetY = 4
	textOffsetX = 0
	textOffsetY = 0
	drawText = true
	
	state = nbutton_state_up
	
	alpha = 1
	
	isHeld = false
	
	choseOption = false
	
	
	function copy(i){
		x1 = i.x1
		y1 = i.y1
		x2 = i.x2
		y2 = i.y2
		rad = i.rad 
		colUp = i.colUp
		colHover = i.colHover
		outlineColUp = i.outlineColUp
		outlineColHover = i.outlineColHover
		textColUp = i.textColUp
		textColHover = i.textColHover
		outlineThickness = i.outlineThickness
		text = i.text
		textHalign = i.textHalign
		textValign = i.textValign
		options = i.options
		currentOption = i.currentOption
		currentOptionHover = i.currentOptionHover
		dropped = i.dropped
		textEdgeOffsetAuto = i.textEdgeOffsetAuto
		textEdgeOffsetX = i.textEdgeOffsetX
		textEdgeOffsetY = i.textEdgeOffsetY
		textSize = i.textSize 
		textHitOffsetX = i.textHitOffsetX
		textHitOffsetY = i.textHitOffsetY 
		textOffsetX = i.textOffsetX
		textOffsetY = i.textOffsetY
		drawText = i.drawText 
		state = i.state
		alpha = i.alpha 
		isHeld = i.isHeld
		choseOption = i.choseOption
	}	
	
	function detectInput(mx,my,input){

		var height =  abs(y2 - y1)
		
		var add_y2 = 0
		
		if dropped == true{
			add_y2 =  (height * (ds_list_size(options)))
		}
		
		choseOption = false
		
		if point_in_rectangle(mx,my,x1,y1,x2,y2 + add_y2){
			state = nbutton_state_hover
			if my > y2{
				currentOptionHover = floor((my - y2)/height) + 1
				currentOptionHover = min(ds_list_size(options),currentOptionHover)
			}

			if input == true{
				if my > y2{
					choseOption = true
				}
				if isHeld == false{
					
					if my > y2{
						currentOption = floor((my - y2)/height)
						currentOption = min(ds_list_size(options),currentOption)
					}

				
					dropped = !dropped
					isHeld = true
				}
			}
			else{
				
				isHeld = false
			}
		}	
		else{

				dropped = false
			
			state = nbutton_state_up
			isHeld = false
		}	
				

			
	}
		
	function autoTextOffset(){
			
		var height =  abs(y2 - y1)
			
		var spaceV = height - (string_height(text) * textSize)
		
		
		textEdgeOffsetX = spaceV/4
	}
	
	function ndraw(){
		
		
		var width = abs(x2 - x1)
		var height =  abs(y2 - y1)
		
		//change colors based on if pressed
		var colCurrent = c_white
		var outlineColCurrent = c_white
		switch state{
			case nbutton_state_up:
				colCurrent = colUp
				outlineColCurrent = outlineColUp
				break
			case nbutton_state_hover:
				colCurrent = colHover
				outlineColCurrent = outlineColHover
				break
			default:
				print_val("error drawing button! button state - ",state)
				break		
		}
		
		
		
		if dropped == false{
			ndraw_roundrect_ext_outline(x1,y1,x2,y1 + height,rad,rad,colCurrent,outlineColCurrent,outlineThickness)
		}
		else{
			ndraw_roundrect_ext_outline(x1,y1,x2,y1 + (height * (ds_list_size(options) + 1)),rad,rad,colCurrent,outlineColCurrent,outlineThickness)
			ndraw_roundrect_ext_outline(x1,y1 + (height * (currentOptionHover)),x2,y1 + (height * (currentOptionHover + 1)),rad,rad,c_yellow,outlineColCurrent,0)
		}
		

			
			
		
		hit = false
		//if sprite make bounder different
			
		var width = abs(x2 - x1)
		var height =  abs(y2 - y1)
			

			
		var drawTextX = x1
		var drawTextY = y1
			
		var currentTextCol = c_white
			
		if textEdgeOffsetAuto == true{
			autoTextOffset()
		}	
			
		switch textHalign{
				
			case ndraw_align_left:
				drawTextX = x1 + textEdgeOffsetX
				draw_set_halign(fa_left)
				break;
			case ndraw_align_center:
				drawTextX = x1 + (width/2)
				draw_set_halign(fa_center)
				break;		
			case ndraw_align_right:
				drawTextX = x2 - textEdgeOffsetX
				draw_set_halign(fa_right)
				break;
			default:
				print_val("error halign on button! button state - ",state)
				break;
		}
		switch textValign{
				
			case ndraw_align_top:
				drawTextY = y1 + textEdgeOffsetY
				draw_set_valign(fa_top)
				break;
			case ndraw_align_middle:
				drawTextY = y1 + (height/2)
				draw_set_valign(fa_center)
				break;
			default:
				print_val("error valign on button! button state - ",state)
				break;
		}		
			
		if state == nbutton_state_down{
			drawTextX += textHitOffsetX
			drawTextY += textHitOffsetY
		}
			
		drawTextX += textOffsetX
		drawTextY += textOffsetY
			
		switch state{
			case nbutton_state_up:
				currentTextCol = textColUp
				break;
			case nbutton_state_hover:
				currentTextCol = textColHover
				break;
			default:
				draw_set_color(c_red)
				print_val("error drawing text color on button! button state - ",state)
				break;
		}			
			

		if currentOption < ds_list_size(options){
			draw_text_transformed_color(drawTextX,drawTextY,text + ds_list_find_value(options,currentOption),textSize,textSize,0,currentTextCol,currentTextCol,currentTextCol,currentTextCol,alpha)
		}
		else{
			draw_text_transformed_color(drawTextX,drawTextY,currentOption ,textSize,textSize,0,currentTextCol,currentTextCol,currentTextCol,currentTextCol,alpha)
		}
		
		
		
		if dropped == true{
			for (var i = 0; i < ds_list_size(options); i++) {
			    draw_text_transformed_color(drawTextX,drawTextY + ((i+1) * height),ds_list_find_value(options,i),textSize,textSize,0,currentTextCol,currentTextCol,currentTextCol,currentTextCol,alpha)
				
			}
		}
		
	}
			
}
