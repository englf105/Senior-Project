var _up = keyboard_check(ord("W"))
var _down = keyboard_check(ord("S"))
var _left = keyboard_check(ord("A"))
var _right = keyboard_check(ord("D"))
var _click = mouse_check_button_released(1)

// Movement inputs
var _hsp = _right - _left
var _vsp = _down - _up

// If this player is the current player
if global.current_player == id {
	// Movement
	hspeed = walkspeed * _hsp
	vspeed = walkspeed * _vsp

	//Player animations
	if _up or _down or _left or _right {sprite_index = spr_player_running}
	else {sprite_index = spr_player_idle}

	// Direction the player is facing
	if _right {image_xscale = 1}
	if _left {image_xscale = -1}
	
	// Kicking
	if _click {
		kick_cooldown = 15
		with instance_nearest(x,y, obj_ball) {
			if in_possession {
				in_possession = false
				direction = point_direction(x, y, mouse_x, mouse_y)
				speed = global.current_player.kick_power;
				alarm[0] = 15
			}
		}
	}
	
	// After Kicking
	if kick_cooldown > 0 {
		sprite_index = spr_player_kicking
		image_index = 1
		image_speed = 0
		kick_cooldown -= 1
	}
	
	// Kicking power
	if mouse_check_button(1) {
		sprite_index = spr_player_kicking
		image_index = 0
		image_speed = 0
		alarm[0] = 1
	}
	else {
		kick_power = 4
		image_speed = 1
	}
	
	// Moving while kicking
	if mouse_check_button(1) {walkspeed = 1}
	else {walkspeed = 2}
}

if global.current_player != id {
	switch (state) {
	    case states.ready:
	        // Code to return to home position or chase ball
	        if (distance_to_object(obj_ball) < 256) and not obj_ball.in_possession {
				if (distance_to_object(obj_ball) < 256) and (distance_to_object(instance_nearest(x,y, obj_player) < 256))
					state = states.chase_ball
	        }
			else {
				state = states.go_home
			}
	        break;
        
	    case states.chase_ball:
	        // Code to move towards the ball
			if  not obj_ball.in_possession {
				direction = point_direction(x, y, obj_ball.x, obj_ball.y)
				speed = walkspeed
			}
	        if (place_meeting(x, y, obj_ball)) {
	            // Check if player has the ball
	            global.current_player = id
	        }
	        break;
        
		case states.open_up:
			// look towards player and move away
			if (distance_to_object(instance_nearest(x,y, obj_player)) < 256)
				direction = point_direction(x, y, obj_ball.x, obj_ball.y)
				speed = walkspeed * -1
			break;
        
	    case states.go_home:
			// code to make player go back to position
			position_home_x = room_width/2 + 64
			position_home_y = room_height/2
	        direction = point_direction(x, y, position_home_x, position_home_y);
			state = states.ready;
	        break;
	}
	
	if speed > 0 {sprite_index = spr_player_running}
	else {sprite_index = spr_player_idle}
	
	if hspeed > 0 {image_xscale = 1}
	if hspeed < 0 {image_xscale = -1}
}