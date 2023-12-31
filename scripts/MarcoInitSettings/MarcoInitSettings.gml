// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function MarcoInitSettings(){
	global.pause		= true;
	global.view_width	= camera_get_view_width(view_camera[0]);
	global.view_height	= camera_get_view_height(view_camera[0]);

	global.key_revert	= ord("X");
	global.key_enter	= vk_enter;
	global.key_left		= ord("A");
	global.key_right	= ord("D");
	global.key_up		= ord("W");
	global.key_down		= ord("S");
}