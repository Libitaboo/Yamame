if _in_inventory{
	if instance_exists(_in_inventory_id){
		if _in_inventory_id._visible{
			draw_self()

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