if visible{
	if _in_inventory{
		if instance_exists(_in_inventory_id){
			if _in_inventory_id._visible{
				if place_meeting(x,y,ObjSystemMouse) or _in_inventory_choose_on{
					if !instance_exists(_info_owned_id){
						_info_owned_id=instance_create_depth(
						x+sprite_width+8,y+sprite_height+12,depth-1,
						ObjRichTyper)
						_info_owned_id._gap=0
						_info_owned_id._text=_info
						_info_owned_id._full_back_color_on=1
						_mouse_on=true
					}else{
						_info_owned_id.x=x+sprite_width+8
						_info_owned_id.y=y+sprite_height+12
					}
				}else{
					if instance_exists(_info_owned_id){
						instance_destroy(_info_owned_id)
						_mouse_on=false
					}
	
				}
				if !_in_inventory_choose_on and !place_meeting(x,y,ObjSystemMouse) and !instance_exists(_info_owned_id){
					_past_x=_in_inventory_x
					_past_y=_in_inventory_y
				}
				if _flash_alpha>0{_flash_alpha-=0.05}
				if _mouse_on{
					_flash_alpha=1
					_relative_x=x-ObjSystemMouse.x
					_relative_y=y-ObjSystemMouse.y
					_mouse_on=false
				}
				if _in_inventory{
					if !place_meeting(x,y,ObjSystemMouse){
						if !_in_inventory_choose_on{
							x=_in_inventory_id._pos_x[_in_inventory_x,_in_inventory_y]
							y=_in_inventory_id._pos_y[_in_inventory_x,_in_inventory_y]
						}else{
							x=ObjSystemMouse.x+_relative_x
							y=ObjSystemMouse.y+_relative_y
						}
					}else{
						if mouse_check_button(mb_left){
							_in_inventory_choose_on=true
							_diff=0
							if _in_inventory_choose_on{
								
								x=ObjSystemMouse.x+_relative_x
								y=ObjSystemMouse.y+_relative_y
							}
							_temp_x=-1
							_temp_y=-1
							for(i=0;i<_in_inventory_id._height;i++){
								for(ii=0;ii<_in_inventory_id._width;ii++){
									_temp_id=ds_grid_get(_in_inventory_id._inventory_grid_item_id,ii,i)
									if _diff=0{
										_diff=point_distance(x+sprite_width/2,y+sprite_height/2,
										_in_inventory_id._pos_x[ii,i]+sprite_width/2,
										_in_inventory_id._pos_y[ii,i]+sprite_height/2)
										_temp_x=ii
										_temp_y=i
									}else{
										if point_distance(x+sprite_width/2,y+sprite_height/2,
										_in_inventory_id._pos_x[ii,i]+sprite_width/2,
										_in_inventory_id._pos_y[ii,i]+sprite_height/2)<_diff{
											_diff=point_distance(x+sprite_width/2,y+sprite_height/2,
											_in_inventory_id._pos_x[ii,i]+sprite_width/2,
											_in_inventory_id._pos_y[ii,i]+sprite_height/2)
											if ds_grid_get(global.inventory,ii,i)!="empty" {
												if instance_exists(_temp_id){
													_temp_x=ii
													_temp_y=i
												}
											}else{
												_temp_x=ii
												_temp_y=i
											}
										}
									}
								}
							}
						}else{
							_in_inventory_choose_on=false
							x=_in_inventory_id._pos_x[_in_inventory_x,_in_inventory_y]
							y=_in_inventory_id._pos_y[_in_inventory_x,_in_inventory_y]
							if _temp_x!=-1 and _temp_x!=_past_x or _temp_x!=-1 and _temp_y!=_past_y{
								if ds_grid_get(global.inventory,_temp_x,_temp_y)!="empty"{
									_temp_id=ds_grid_get(_in_inventory_id._inventory_grid_item_id,_temp_x,_temp_y)
									_temp_name=ds_grid_get(global.inventory,_temp_x,_temp_y)
									ds_grid_set(global.inventory,_past_x,_past_y,_temp_name)
									ds_grid_set(global.inventory,_temp_x,_temp_y,string_replace(object_get_name(object_index),"ObjItem",""))
									_temp_id._in_inventory_x=_past_x
									_temp_id._in_inventory_y=_past_y
									_in_inventory_x=_temp_x
									_in_inventory_y=_temp_y
									ds_grid_set(_in_inventory_id._inventory_grid_item_id,_temp_x,_temp_y,id)
									ds_grid_set(_in_inventory_id._inventory_grid_item_id,_past_x,_past_y,_temp_id)
								}else{
									ds_grid_set(global.inventory,_past_x,_past_y,"empty")
									ds_grid_set(global.inventory,_temp_x,_temp_y,string_replace(object_get_name(object_index),"ObjItem",""))
									_in_inventory_x=_temp_x
									_in_inventory_y=_temp_y
									ds_grid_set(_in_inventory_id._inventory_grid_item_id,_temp_x,_temp_y,id)
									ds_grid_set(_in_inventory_id._inventory_grid_item_id,_past_x,_past_y,noone)
								}
								_temp_x=-1
								_temp_y=-1
								_past_x=_in_inventory_x
								_past_y=_in_inventory_y
							}
						}
							
						
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