// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function MoveXYNormal(_xspeed,_yspeed){
	//repeat _speed{
	if abs(_xspeed)+abs(_yspeed)>_xspeed{
		_temp_fix=sqrt(2)	
	}else{
		_temp_fix=1	
	}
	move_and_collide(
	x+_xspeed/_temp_fix,
	y+_yspeed/_temp_fix,
	ObjBarrier,
	)
	
	//}
}