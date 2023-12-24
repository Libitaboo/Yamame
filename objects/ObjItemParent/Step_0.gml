if visible{
	if _in_inventory{
		if instance_exists(_in_inventory_id){
			if _in_inventory_id._visible{
				if place_meeting(x,y,ObjSystemMouse){
					if !instance_exists(_info_owned_id){
						_info_owned_id=instance_create_depth(
						x+sprite_width+8,y+sprite_height+12,depth-1,
						ObjRichTyper)
						_info_owned_id._gap=0
						_info_owned_id._text=_info
						_info_owned_id._full_back_color_on=1
						_mouse_on=true
					}	
				}else{
					if instance_exists(_info_owned_id){
						instance_destroy(_info_owned_id)
						_mouse_on=false
					}
	
				}
				if _flash_alpha>0{_flash_alpha-=0.05}
				if _mouse_on{
					_flash_alpha=1
					_mouse_on=false
					if _in_inventory{
						if mouse_check_button_pressed(mb_left){
							x=ObjSystemMouse.x
							y=ObjSystemMouse.y
						}
					}
				}else{
					if _in_inventory{
						x=_in_inventory_id._pos_x[_in_inventory_x,_in_inventory_y]
						y=_in_inventory_id._pos_y[_in_inventory_x,_in_inventory_y]
					}
				}
			}
		}
	}else{
		if place_meeting(x,y,ObjSystemMouse){
					if !instance_exists(_info_owned_id){
						_info_owned_id=instance_create_depth(
						x+sprite_width+8,y+sprite_height+12,depth-1,
						ObjRichTyper)
						_info_owned_id._gap=0
						_info_owned_id._text=_info
						_info_owned_id._full_back_color_on=1
						_mouse_on=true
					}	
				}else{
					if instance_exists(_info_owned_id){
						instance_destroy(_info_owned_id)
						_mouse_on=false
					}
	
				}
				if _flash_alpha>0{_flash_alpha-=0.05}
				if _mouse_on{
					_flash_alpha=1
					_mouse_on=false
				}
	}
}