for(var i = 0; i < ds_list_size(lights);i++){
	var li = ds_list_find_value(lights,i)
	li.update()
}