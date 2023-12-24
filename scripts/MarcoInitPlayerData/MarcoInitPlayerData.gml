// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function MarcoInitPlayerData(){
	ini_open("saves/save.ini")
	if ini_section_exists("Inventory"){
		global.inventory_width=ini_read_real("Inventory","width",4)
		global.inventory_height=ini_read_real("Inventory","height",4)
		global.inventory=ds_grid_create(global.inventory_width,global.inventory_height)
		for(i=0;i<global.inventory_height;i++){
			for(ii=0;ii<global.inventory_width;ii++){
				if ini_key_exists("Inventory","pos["+string(ii)+","+string(i)+"]"){
					ds_grid_set(global.inventory,ii,i,ini_read_string("Inventory",
					"pos["+string(ii)+","+string(i)+"]","empty"))	
				}else{
					ini_write_string("Inventory","pos["+string(ii)+","+string(i)+"]",
					"empty")
					ds_grid_set(global.inventory,ii,i,ini_read_string("Inventory",
					"pos["+string(ii)+","+string(i)+"]","empty"))	
				}
			}
		}
	}else{
		ini_write_string("Inventory","width",4)
		ini_write_string("Inventory","height",4)
		global.inventory_width=ini_read_real("Inventory","width",4)
		global.inventory_height=ini_read_real("Inventory","height",4)
		global.inventory=ds_grid_create(global.inventory_width,global.inventory_height)
		for(i=0;i<global.inventory_height;i++){
			for(ii=0;ii<global.inventory_width;ii++){
				if ini_key_exists("Inventory","pos["+string(ii)+","+string(i)+"]"){
					ds_grid_set(global.inventory,ii,i,ini_read_string("Inventory",
					"pos["+string(ii)+","+string(i)+"]","empty"))	
				}else{
					ini_write_string("Inventory","pos["+string(ii)+","+string(i)+"]",
					"empty")
					ds_grid_set(global.inventory,ii,i,ini_read_string("Inventory",
					"pos["+string(ii)+","+string(i)+"]","empty"))	
				}
			}
		}
	}
	ini_close()
}