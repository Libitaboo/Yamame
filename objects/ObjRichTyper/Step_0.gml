_timer++
_out_break=false
	_color=c_white
	if _wait>0{
		_wait--	
	}
	if _gap=0{
	    while _t<string_length(_text){
	        _t++
	    }
	}else{
	    if string_char_at(_text,_t)="{"{
			_t++
			_command_size=0
	         while string_char_at(_text,_t)!="}" and string_char_at(_text,_t+1)!="{"{
				if string_char_at(_text,_t)="}"{
					_t++	
				}
				if string_char_at(_text,_t)=","{
					_command_size++
					_sub_command[_command_size]=""
					_t++
					while string_char_at(_text,_t)!="}"
					{
							_sub_command[_command_size]+=string_char_at(_text,_t)
							_t++
							if string_char_at(_text,_t)="}"{
							_out_break=true
							break
						}
						if string_char_at(_text,_t)=","{
							_command_size++
							_sub_command[_command_size]=""
							_t++
						}
					 
					}
				}
				if _out_break{
					_out_break=false
					break	
				}
	            _command+=string_char_at(_text,_t)
	            _t++
			
				}
	        
	        _t++
			if _command="wait"{
				_wait=real(_sub_command[1])
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
	        if _command="white"{
	            _color=c_white
	        }
			 if _command="once"{
	            _gap=0
	        }
	    }
	    if _timer mod _gap=0 and _wait<=0{
	        if _t<string_length(_text){
	            _t++
	        }
	    }
		if _t>=string_length(_text){
			_status="done"
		}
	
	}