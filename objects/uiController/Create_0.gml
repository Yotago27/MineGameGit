
depth = -500
firstStep = true;
guiScale = 1
guiScaleRounded = 1

exitKey = vk_escape
exitScreenUp = false
//vars in end step

fullscreenSwitchCooldown = 0
toggleFullscreen = false

waitTillMouseRelease = false

sendResW = 0
sendResH = 0

basicButton = new nbutton()

exitButton = new nbutton()

fullscreenButton = new nbutton()

resoultionSelector = new nselector()
resoultionSelector.currentOption = 1
ds_list_add(resoultionSelector.options,"960 x 540")
ds_list_add(resoultionSelector.options,"1920 x 1080")
ds_list_add(resoultionSelector.options,"2560 x 1440")
ds_list_add(resoultionSelector.options,"3840 x 2160")

