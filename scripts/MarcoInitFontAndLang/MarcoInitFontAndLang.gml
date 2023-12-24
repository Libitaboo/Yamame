// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function MarcoInitFontAndLang(){
	global.font_standard=font_add("fonts/Font.TTF",16,false,false,0,99999)
	font_enable_sdf(global.font_standard,true)
	global.language="cn"
}