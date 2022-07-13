draw_self()
if abs(player.x - x) <= shopOpenDistance and player.aboveGround = true{

	var sh = string_height(shopMenuOpenText) * uiController.guiScaleRoundedSmaller
	var sw = string_width(shopMenuOpenText) * uiController.guiScaleRoundedSmaller
	var sbo = 8
	draw_set_color(c_black)
	draw_set_alpha(0.5)
	draw_roundrect_ext(x - (sw/2) - sbo, (y-28) - (sh/2) - sbo,
	x + (sw/2) + sbo, (y-28) + (sh/2) + sbo,
	4,4,false)
	ndraw_reset()
	draw_set_halign(fa_center)
	draw_set_valign(fa_center)	
	draw_set_color(c_white)
	draw_text_ext_transformed(x,y - 28,shopMenuOpenText,0,100000,uiController.guiScaleRoundedSmaller,uiController.guiScaleRoundedSmaller,0)


}