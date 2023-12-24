// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EaseMain(){
var _t;_t = argument0
var _begin;_begin = argument1
var _change;_change = argument2
var _duration;_duration = argument3
var _type;_type = argument4
var _mode;_mode = argument5
var _temp;_temp = 0
switch _type {
    case "linear":
        _temp = _change * _t / _duration + _begin
    break;
    case "sine":
        if _mode == "in" _temp = -_change * cos(_t / _duration * (pi / 2)) + _change + _begin
        else if _mode == "out" _temp = _change * sin(_t / _duration * (pi / 2)) + _begin
        else _temp = -_change / 2 * (cos(pi * _t / _duration) - 1) + _begin;
    break;
    case "quad":
        if _mode == "in" _temp = _change * power((_t / _duration), 2) + _begin;
        else if _mode == "out" _temp = -_change * (_t / _duration) * (_t / _duration - 2) + _begin
        else {
            if (_t / _duration * 2) < 1 _temp = _change / 2 * power((_t / _duration * 2), 2) + _begin
            else _temp = -_change / 2 * ((_t / _duration * 2 - 1) * (_t / _duration * 2 - 3) - 1) + _begin
        }
    break;
    case "cubic":
        if _mode == "in" _temp = _change * power((_t / _duration), 3) + _begin;
        else if _mode == "out" _temp = _change * (power(_t / _duration - 1, 3) + 1) + _begin        
        else {
            if (_t / _duration * 2) < 1 _temp = _change / 2 * power((_t / _duration * 2), 3) + _begin
            else _temp = _change / 2 * (power(_t / _duration * 2 - 2, 3) +2) + _begin
        }
    break;
    case "quart":
        if _mode == "in" _temp = _change * power((_t / _duration), 4) + _begin;
        else if _mode == "out" _temp = -_change * (power(_t / _duration - 1, 4) - 1) + _begin        
        else {
            if (_t / _duration * 2) < 1 _temp = _change / 2 * power((_t / _duration * 2), 4) + _begin
            else _temp = -_change / 2 * (power(_t / _duration * 2 - 2, 4) - 2) + _begin
        }
    break;
    case "quint":
        if _mode == "in" _temp = _change * power((_t / _duration), 5) + _begin;
        else if _mode == "out" _temp = _change * (power(_t / _duration - 1, 5) + 1) + _begin        
        else {
            if (_t / _duration * 2) < 1 _temp = _change / 2 * power((_t / _duration * 2), 5) + _begin
            else _temp = _change / 2 * (power(_t / _duration * 2 - 2, 5) +2) + _begin
        }
    break;
    case "expo":
        if _mode == "in" { if _t == 0 _temp = _begin else _temp = _change * power(2, 10 * (_t / _duration - 1)) + _begin }
        else if _mode == "out" { 
            _temp = _change * (-power(2, -10 * _t / _duration) + 1) + _begin 
            if _t == 0 _temp = _begin
            if _t == _duration _temp = _begin + _change
        } else {
            _temp = _change / 2 * (-power(2, -10 * ((_t / _duration * 2) - 1)) + 2) + _begin;
            if (_t / _duration * 2) < 1 _temp = _change / 2 * power(2, 10 * (_t / _duration * 2 - 1)) + _begin
            if _t == 0  _temp = _begin
            if _t == _duration _temp = _begin + _change
        }        
    break;
    case "circ":
        if _mode == "in" _temp = -_change * (sqrt(1 - power(_t / _duration, 2)) - 1) + _begin
        else if _mode == "out" _temp = _change * sqrt(1 - power(_t / _duration - 1, 2)) + _begin
        else { 
            if (_t / _duration * 2) < 1 _temp = -_change / 2 * (sqrt(1 - power(_t / _duration * 2, 2)) - 1) + _begin
            else _temp = _change / 2 * (sqrt(1 - power(_t / _duration * 2 - 2, 2)) + 1) + _begin
        }
    break;
    case "back":
        if _mode == "in" _temp = _change * power(_t / _duration, 2) * ((1.7015401988668242 + 1) * (_t / _duration) - 1.7015401988668242) + _begin
        else if _mode == "out" _temp = _change * (power(_t / _duration - 1, 2) * ((1.7015401988668242 + 1) * (_t / _duration - 1) + 1.7015401988668242) + 1) + _begin
        else {
            if (_t / _duration * 2 < 1) _temp = _change / 2 * (power(_t / _duration * 2, 2) * ((2.5923889015162995 + 1) * (_t / _duration * 2) - 2.5923889015162995)) + _begin;
            else _temp = _change / 2 * (power(_t / _duration * 2 - 2, 2) * ((2.5923889015162995 + 1) * (_t / _duration * 2 - 2) + 2.5923889015162995) + 2) + _begin;
        }
    break;
    case "elastic":
        if _mode == "in" do {
            var s;s = 1.7015401988668242
            var p;p = _duration * 0.3
            var a;a = _change
            if _t == 0 { _temp = _begin continue }
            if (_t / _duration) == 1 { _temp = _begin + _change continue }
            if (a < abs(_change)) {
                a = _change
                s = p / 4
            }
            else s = p / (2 * pi) * arcsin(_change / a)
            _temp = -(a * power(2, 10 * (_t / _duration - 1)) * sin(((_t / _duration - 1) * _duration - s) * (2 * pi) / p)) + _begin
        } until (true) 
        else if _mode == "out" do {
            var s;s = 1.7015401988668242
            var p;p = _duration * 0.3
            var a;a = _change
            if _t == 0 { _temp = _begin continue }
            if (_t / _duration) == 1 { _temp = _begin + _change continue }
            if (a < abs(_change)) {
                a = _change
                s = p / 4
            }
            else s = p / (2 * pi) * arcsin(_change / a)
            _temp = (a * power(2, -10 * (_t / _duration)) * sin((_t - s) * (2 * pi) / p)) + _change + _begin
        } until (true)
        else do {
            var s;s = 1.7015401988668242
            var p;p = _duration * 0.3 * 1.5
            var a;a = _change
            if _t == 0 { _temp = _begin continue };
            if (_t / _duration * 2) == 2 { _temp = _begin + _change continue }
            if (a < abs(_change)) {
                a = _change
                s = p / 4
            }
            else s = p / (2 * pi) * arcsin(_change / a);
            if (_t / _duration * 2 < 1) _temp = -0.5 * (a * power(2, 10 * (_t / _duration * 2 - 1))) * sin(((_t * 2 - 1) - s) * (2 * pi) / p) + _begin
            else _temp = a * power(2, -10 * (_t / _duration * 2 - 1)) * sin(_t * 2) * ((2 * pi) / p) * 0.5 + _change + _begin
        } until (true)
        // Bounce 基本没有不用递归的算法，待补充
    break;
    /*case "":
        if _mode == "in" _temp = 0
        else if _mode == "out" _temp = 0
        else _temp = 0
    break;*/
}
return _temp
}