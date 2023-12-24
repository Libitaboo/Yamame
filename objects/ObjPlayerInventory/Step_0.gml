if _visible{
	if keyboard_check_released(vk_tab){
		_press_cold_down=0	
	}
	if _timer<=15{
		_bounce=EaseMain(_timer,0,6,15,"back","inout")
		_alpha=EaseMain(_timer,0,0.7,15,"back","inout")
	}else{
		if _timer<=30{
			_bounce=EaseMain(_timer,6,0,30,"back","inout")
		}
	}
	if keyboard_check(vk_tab) and _press_cold_down=0{
		_visible=false
		_timer=15
		_press_cold_down=1
		keyboard_clear(vk_tab)
	}
	_timer++
	_box_size=36+_bounce
}else{
	if keyboard_check_released(vk_tab){
		_press_cold_down=0	
	}
	_timer--
	_alpha=EaseMain(_timer,0.7,0,15,"circ","in")
	_bounce=EaseMain(_timer,6,-36,15,"back","inout")
	if keyboard_check(vk_tab) and _press_cold_down=0{
		_visible=true
		_timer=0
		_press_cold_down=1
		keyboard_clear(vk_tab)
	}
}

_timer=clamp(_timer,0,30)
_width=ds_grid_width(global.inventory)
_height=ds_grid_height(global.inventory)
ds_grid_resize(_inventory_grid_item_id,_width,_height)