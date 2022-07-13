//for printing var value
function print_val(str,val){
	show_debug_message(string(str) + string(val))
}
function ds_list_log(str,list){
	show_debug_message("ds_list: " + string(str))
	for(var i = 0; i < ds_list_size(list); i++){
		show_debug_message(ds_list_find_value(list,i))
	}	
}
function print(str){
	show_debug_message(string(str))
}