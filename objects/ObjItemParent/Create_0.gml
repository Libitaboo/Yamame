_flash_alpha=0
_info_owned_id=noone
_mouse_on=false
_in_inventory=false
_in_inventory_id=noone
_in_inventory_x=0
_in_inventory_y=0
_in_inventory_choose_on=false
_past_x=0
_past_y=0
_temp_x=-1
_temp_y=-1
_relative_x=0
_relative_y=0
_file=file_text_open_read("texts/"+global.language+"/item_info/"+
string_insert("info",
string_copy(
object_get_name(object_index),
4,
string_length(object_get_name(object_index))),
5)+".txt")
_info=file_text_read_string(_file)
file_text_close(_file)
image_xscale=2
image_yscale=2