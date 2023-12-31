_back=false
_x=x
_y=y
_now_x=_x
_now_y=_y
_max_char_width=0
_max_char_height=0

_command_size=0
_angle=0
_out_break=false
_sub_command[1]=""
_sub_command[2]=""
_sub_command[3]=""

_shake=0
_shake_sto_x=0
_shake_sto_y=0
_shake_x=0
_shake_y=0
var _con
_con=0
if _full_back_color_on{
		draw_set_color(_full_back_color)
		draw_set_alpha(_box_alpha)
		draw_rectangle(x-5-_box_wave,y-5-_box_wave,x+_max_line_width+_box_wave,y+_full_height+5+_box_wave,0)
		draw_set_color(make_color_rgb(255,255,255))
		draw_set_alpha(_box_alpha)
		for(_i=0;_i<3;_i++){
			draw_rectangle(x-5-_box_wave-_i,
			y-5-_box_wave-_i,
			x+_max_line_width+_box_wave+_i,
			y+_full_height+5+_box_wave+_i,1)
		}
			if _timer<=30{
				_box_wave=(EaseMain(_timer,-2,4,30,"back","out"))
			}
		_box_alpha=(lerp(_box_alpha,1,0.1))
		
}
_line_count=0
_line_str_len[_line_count]=0
_line_width[_line_count]=0
for(_i=0;_i<_max_line_count;_i++){
	_line_str_len[_i]=0
}
_out_break=false
_command=""
_final_len=0
draw_set_font(global.font_standard)
draw_set_color(_color)
_total_len=0
_full_height=0
_max_line_width=0
for(_i=1;_i<string_length(string_copy(_text,0,_t))+1;_i++){
	
	if _con and string_char_at(_text,_i-1)="{"{
		_i--
		_con=false
	}
    _char_now=string_char_at(_text,_i)
	_command_size=0
	_sub_command[1]=""
	_sub_command[2]=""
	_sub_command[3]=""
	
    _command=""
    _char_now=string_char_at(_text,_i)
    _char_width=string_width(_char_now)
    _char_height=string_height(_char_now)
    _max_char_width=max(_char_width,_max_char_width)
    _max_char_height=max(_char_height,_max_char_height)
	
	//stat
	
    if string_char_at(_text,_i)="{"{
        _i++
        _con=1
        while string_char_at(_text,_i)!="}" and string_char_at(_text,_i+1)!="{"{
			if string_char_at(_text,_i)="}"{
				_i++	
			}
			if string_char_at(_text,_i)=","{
				_command_size++
				_sub_command[_command_size]=""
				_i++
				while string_char_at(_text,_i)!="}"
				{
						_sub_command[_command_size]+=string_char_at(_text,_i)
						_i++
						if string_char_at(_text,_i)="}"{
						_out_break=true
						break
					}
					if string_char_at(_text,_i)=","{
						_command_size++
						_sub_command[_command_size]=""
						_i++
					}
					 
				}
			}
			if _out_break{
				_out_break=false
				break	
			}
            _command+=string_char_at(_text,_i)
            _i++
			
        }
        _i++
		if _command="font_effect_outline"{
				font_enable_effects(global.font_standard, true, {
				    outlineEnable: true,
				    outlineDistance: real(_sub_command[1]),
				    outlineColour: make_color_rgb(real(_sub_command[2]),real(_sub_command[3]),real(_sub_command[4]))
				});
		}
		if _command="/font_effect_outline"{
				font_enable_effects(global.font_standard, true, {
				    outlineEnable: false
				});
		}
		if _command="font_effect_glow_simple"{
			font_enable_effects(global.font_standard, true, {
			    glowEnable: true,
			    glowEnd: real(_sub_command[1]),
			    glowColour: _color
			});	
		}
		if _command="/font_effect_glow_simple"{
			font_enable_effects(global.font_standard, true, {
			    glowEnable: false
			});	
		}
		if _command="color"{
			_color=make_color_rgb(
			real(_sub_command[1]),
			real(_sub_command[2]),
			real(_sub_command[3]))
		}
		if _command="/backcolor"{
			_back_color_on=0
		}
		if _command="draw_sprite_custom_ext"{
				draw_sprite_ext(asset_get_index(_sub_command[1]),_sub_command[2],
				_sub_command[3],_sub_command[4],_sub_command[5],_sub_command[6],
				_sub_command[7],
				make_color_rgb(_sub_command[8],_sub_command[9],_sub_command[10]),
				_sub_command[11])
		}
		if _command="draw_sprite_default_ext"{
				draw_sprite_ext(asset_get_index(_sub_command[1]),_sub_command[2],
				_now_x+_sub_command[3],_now_y+_sub_command[4],_sub_command[5],_sub_command[6],
				_sub_command[7],
				make_color_rgb(_sub_command[8],_sub_command[9],_sub_command[10]),
				_sub_command[11])
				_now_x+=sprite_get_width(asset_get_index(_sub_command[1]))+4
		}
		if _command="shake"{
			_shake=1
			_shake_sto_x=real(_sub_command[1])
			_shake_sto_y=real(_sub_command[2])
		}
		if _command="scale"{
			_xscale=real(_sub_command[1])
			_yscale=real(_sub_command[2])
		}
		if _command="!shake" or _command="/shake"{
			_shake=0
			_shake_sto_x=0
			_shake_sto_y=0
			_shake_x=0
			_shake_y=0
		}
		if _command="color_var_id_array"{
			_color=real(_sub_command[1])._color[real(_sub_command[2])]
		}
		if _command="backcolor_var_id_array"{
			_back_color_on=1
				_back_color=real(_sub_command[1])._back_color[real(_sub_command[2])]
		}
		if _command="insert_var_id"{
			for(_ii=0;_ii<string_length(string(variable_instance_get(real(_sub_command[1]),_sub_command[2])));_ii++){
					_xscale[string_length(_text)+_ii]=1
					_alpha[string_length(_text)+_ii]=0
					_upper_alpha[string_length(_text)+_ii]=0
			}
			if variable_instance_exists(real(_sub_command[1]),_sub_command[2]){
				//_text=string_insert(string(variable_instance_get(real(_sub_command[1]),_sub_command[2])),_text,_i)
				}
				//_color=real(_sub_command[1])._color[real(_sub_command[2])]
		}
		if _command="gap"{
            _gap=_sub_command[1]
        }
		if _command="spin"{
            _angle=_sub_command[1]
        }
		if _command="spin_plus"{
            _angle+=_sub_command[1]
        }
		if _command="rainbow"{
            _rainbow=1
			_rainbow_arg_1=real(_sub_command[1])
			_rainbow_arg_2=real(_sub_command[2])
			_rainbow_arg_3=real(_sub_command[3])
        }
		if _command="/rainbow"{
            _rainbow=0
		}
		if _command="red"{
            _color=c_red
        }
        if _command="blue"{
            _color=c_blue
        }
        if _command="green"{
            _color=c_green
        }
        if _command="yellow"{
            _color=c_yellow
        }
        if _command="gray"{
            _color=c_gray
        }
		if _command="maroon"{
            _color=c_maroon
        }
		if _command="black"{
            _color=c_black
        }
        if _command="white"{
            _color=c_white
        }
		if _command="aqua"{
            _color=c_aqua
        }
		if _command="lime"{
			_color=c_lime	
		}
		if _command="once"{
            _gap=0
        }
		if _command="%"{
			_next=true
			_end=_i
			break
		}
		if _command="&"{
			_now_x=_x
			_now_y+=real(_sub_command[1])*(_char_height+7)
			_final_len+=_total_len
			_total_len=0
			_command=""
			if _full_height=0{
				_full_height+=_max_char_height
			}
			_full_height+=(_max_char_height+7)*real(_sub_command[1])
			_line_count++
			_line_str_len[_line_count]=0
			_line_width[_line_count]=0
		}
		
	
    }
	if string_char_at(_text,_i)="{"{
		_i++
		_back=true
	}
	
	
	
	if _shake{
		_shake_x=random_range(-_shake_sto_x,_shake_sto_x)
		_shake_y=random_range(-_shake_sto_y,_shake_sto_y)
	}
	if _rainbow{
		
		_color=make_color_rgb(
		sin(degtorad(((_timer+_i*_rainbow_arg_3)*_rainbow_arg_1)/_rainbow_arg_2))*(255/2)+(255/2),
		sin(pi/2+degtorad(((_timer+_i*_rainbow_arg_3)*_rainbow_arg_1)/_rainbow_arg_2))*(255/2)+(255/2),
		sin(pi+degtorad(((_timer+_i*_rainbow_arg_3)*_rainbow_arg_1)/_rainbow_arg_2))*(255/2)+(255/2))
		
		
	}
	
	
	_str_len+=_char_width*_xscale+2
	
    _char_now=string_char_at(_text,_i)
    _char_width=string_width(_char_now)*_xscale
    _char_height=string_height(_char_now)*_yscale
    _max_char_width=max(_char_width,_max_char_width)
    _max_char_height=max(_char_height,_max_char_height)
    
	
	if !_back{
		if _char_now!="&"{
			if _back_color_on {
				draw_set_color(_back_color)
				draw_set_alpha(1)
				draw_rectangle(_now_x+_shake_x-4,_now_y+_shake_y-4,
				_now_x+_shake_x+_char_width+1,_now_y+_shake_y+_char_height+2,0)
			}
	
			draw_text_ext_transformed_colour(_now_x+_shake_x,
			_now_y+_shake_y,string_char_at(_text,_i),99,99,_xscale+0.25,_yscale+0.25,
		    _angle,_color,_color,_color,_color,0.25*_alpha)
		
		    draw_text_ext_transformed_colour(_now_x+_shake_x,
			_now_y+_shake_y,string_char_at(_text,_i),99,99,_xscale,_yscale,
		    _angle,_color,_color,_color,_color,_alpha)
		}else{
			if string_char_at(_text,_i-1)="/"{
				if _back_color_on {
					draw_set_color(_back_color)
					draw_set_alpha(1)
					draw_rectangle(_now_x+_shake_x-4,_now_y+_shake_y-4,
					_now_x+_shake_x+_char_width+1,_now_y+_shake_y+_char_height+2,0)
				}
	
				draw_text_ext_transformed_colour(_now_x+_shake_x,
				_now_y+_shake_y,string_char_at(_text,_i),99,99,_xscale+0.25,_yscale+0.25,
			    _angle,_color,_color,_color,_color,0.25*_alpha)
		
			    draw_text_ext_transformed_colour(_now_x+_shake_x,
				_now_y+_shake_y,string_char_at(_text,_i),99,99,_xscale,_yscale,
			    _angle,_color,_color,_color,_color,_alpha)
			}
		}
	}
		_line_str_len[_line_count]++
		_line_width[_line_count]+=_char_width+4
		_max_line_count=max(_max_line_count,_line_count)
		
		
	if !_back{
		_now_x+=_char_width+4
	}
	_total_len+=_char_width+2
	//_final_len=max(_final_len,_total_len)
	if _back{
		_i--
		_back=false
		
	}
}
for(_i=0;_i<_max_line_count+1;_i++){
	_max_line_width=max(_max_line_width,_line_width[_i])
}
_final_len+=_total_len
if mouse_check_button(mb_left)	
or keyboard_check(vk_anykey){
	if _status!="fin"{
		_t++
		if string_char_at(_text,_t)="{"{
	        while string_char_at(_text,_t)!="}"{
	            _t++
				if _t>string_length(_text){break}
	        }
		}
	}
}
draw_set_color(c_white)
draw_set_alpha(1)

