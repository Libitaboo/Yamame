if _in_inventory{
	if instance_exists(_in_inventory_id){
		if _in_inventory_id._visible{
			draw_self()
			if place_meeting(x,y,ObjSystemMouse){
				draw_set_color(c_lime)
				draw_set_alpha(1)
				//draw_text(x,y,"px : "+string(_past_x)+", py : "+string(_past_y)+",count : "+string(instance_number(object_index)))
			}
			if _flash_alpha>0{
				shader_set(ShdFlash)
	
				draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,
				c_white,_flash_alpha)
	
				shader_reset()
			}
		}
	}
}else{
	if visible{
		draw_self()

		if _flash_alpha>0{
			shader_set(ShdFlash)
	
			draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,
			c_white,_flash_alpha)
	
			shader_reset()
		}
	}
}