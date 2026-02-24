var _up = keyboard_check(ord("W"))
var _down = keyboard_check(ord("S"))
var _left = keyboard_check(ord("A"))
var _right = keyboard_check(ord("D"))

var _hsp = _right - _left
var _vsp = _down - _up

if global.current_player == id {
	x += walkspeed * _hsp
	y += walkspeed * _vsp

	if _up or _down or _left or _right {
		sprite_index = spr_player_running
	}
	else {
		sprite_index = spr_player_idle
	}

	if _right {
		image_xscale = 1
	}
	if _left {
		image_xscale = -1
	}
}