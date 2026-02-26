var _up = keyboard_check(ord("W"))
var _down = keyboard_check(ord("S"))
var _left = keyboard_check(ord("A"))
var _right = keyboard_check(ord("D"))
var _space = keyboard_check_pressed(vk_space)

// Movement inputs
var _hsp = _right - _left
var _vsp = _down - _up

// If this player is the current player
if global.current_player == id {
	// Movement
	hspeed = walkspeed * _hsp
	vspeed = walkspeed * _vsp

	// Slide tackling


	// Kicking
	if _space {
		with instance_nearest(x, y, obj_ball) {
			if in_possession {
				in_possession = false
				direction = distance_to_point(mouse_x, mouse_y)
				speed = 15
				while speed > 0 {
					speed -= 1
				}
			}
		}
	}

	//Player animations
	if _up or _down or _left or _right {sprite_index = spr_player_running}
	else {sprite_index = spr_player_idle}

	// Direction the player is facing
	if _right {image_xscale = 1}
	if _left {image_xscale = -1}
}