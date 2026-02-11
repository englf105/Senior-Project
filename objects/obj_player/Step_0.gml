var _up = keyboard_check(ord("W"));
var _left = keyboard_check(ord("A"));
var _down = keyboard_check(ord("S"));
var _right = keyboard_check(ord("D"));
var _kick = mouse_check_button_released(1);
var _slide = keyboard_check_pressed(vk_shift);

if global.current_player == id {
	x_moving = _right - _left
	y_moving = _down - _up

	// Moving
	if !keyboard_check_pressed(vk_shift) {
		hspeed = x_moving * walkspeed;
		vspeed = y_moving * walkspeed;
	}

	// Kicking
	if has_possesion and _kick {
		can_possess = false;
		alarm[0] = 30;
		with instance_nearest(x,y, obj_ball) {
			direction = point_direction(x, y, mouse_x, mouse_y)
			speed = instance_nearest(x,y, obj_player).kick_power;
		}
	}
	
	// Slowing down when kicking
	if mouse_check_button(1) {
		walkspeed = 1
	}
	else {
		walkspeed = 2
	}


	// Kicking Power
	if mouse_check_button(1)
		alarm[1] = 1
	else {
		kick_power = 8
	}
}
if global.current_player != id  {
	
	speed = 0
//
//	direction = point_direction(x, y, global.current_player.x, global.current_player.y)
//	speed = walkspeed
//	if collision_circle(global.current_player.x, global.current_player.y, 120, id, false, false) {
//		speed = 0


}


// Has Ball
if place_meeting(x, y, obj_ball) and can_possess and !global.ball_possesion {
	has_possesion = true;
	global.ball_possesion = true;
}
else {
	has_possesion = false;
	global.ball_possesion = false;
}