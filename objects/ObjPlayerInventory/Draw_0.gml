if _visible{
	draw_set_alpha(_alpha)
	draw_set_color(c_black)
	draw_rectangle(x-8,y-8,
	x+(_width)*abs(36-_box_size)+(_width)*(_box_size)-12,
	y+(_height)*abs(36-_box_size)+(_height)*(_box_size)+6,0)
	draw_set_color(c_white)
	draw_set_alpha(1)
	draw_rectangle(x-8,y-8,
	x+(_width)*abs(36-_box_size)+(_width)*(_box_size)-12,
	y+(_height)*abs(36-_box_size)+(_height)*(_box_size)+6,1)
	draw_set_font(global.font_standard)
	if global.language="en"{
		draw_text(x,y-2,"Inventory")
	}
	if global.language="cn"{
		draw_text(x,y-4,"背包")
	}
	for(i=0;i<_height;i++){
		for(ii=0;ii<_width;ii++){
			draw_set_alpha(_alpha)
			draw_set_color(c_black)
			draw_rectangle(x+2+_box_size*ii,
			y+20+_box_size*i,x+2+_box_size*ii+36,
			y+20+_box_size*i+36,0)
			draw_set_color(c_white)
			draw_rectangle(x+2+_box_size*ii,
			y+20+_box_size*i
			,x+2+_box_size*ii+36,
			y+20+_box_size*i+36,1)
			_pos_x[ii,i]=x+2+_box_size*ii+_bounce-4
			_pos_y[ii,i]=y+20+_box_size*i+_bounce-4
			draw_set_color(c_red)
			draw_set_alpha(1)
			draw_point(_pos_x[ii,i],_pos_y[ii,i])
			if string(ds_grid_get(_inventory_grid_item_id,ii,i))="0"{
				ds_grid_set(_inventory_grid_item_id,ii,i,noone)
			}
			if ds_grid_get(global.inventory,ii,i)!="empty"{
				if !instance_exists(ds_grid_get(_inventory_grid_item_id,ii,i)){
					_temp_name=ds_grid_get(global.inventory,ii,i)
					while string_pos(" ",_temp_name)!=0{
						_temp_name=string_delete(ds_grid_get(global.inventory,ii,i),
						 string_pos(" ",_temp_name),1)
					}
					_temp_id=instance_create_depth(_pos_x[ii,i],_pos_y[ii,i],
					depth-1,asset_get_index("ObjItem"+_temp_name))
					_temp_id._in_inventory=true
					_temp_id._in_inventory_id=id
					_temp_id._in_inventory_x=ii
					_temp_id._in_inventory_y=i
					ds_grid_set(_inventory_grid_item_id,ii,i,_temp_id)	
				}
			}
		}
	}
}
draw_text(10,10,_temp_name)