var _up = keyboard_check(ord("W"));
var _down = keyboard_check(ord("S"));
var _left = keyboard_check(ord("A"));
var _right = keyboard_check(ord("D"));
var _click = mouse_check_button_released(1);
var _tackle = keyboard_check_pressed(vk_space);

// Movement inputs
var _hsp = _right - _left;
var _vsp = _down - _up;

// If this player is the current player
if global.current_player == id {
	if can_move {
		
		// Movement
		hspeed = walkspeed * _hsp;
		vspeed = walkspeed * _vsp;

		//Player animations
		if _up or _down or _left or _right {sprite_index = spr_player_running;}
		else {sprite_index = spr_player_idle;}

		// Direction the player is facing
		if hspeed > 0 {image_xscale = 1;}
		if hspeed < 0 {image_xscale = -1;}
		
		// Kicking
		if _click and obj_ball.in_possession {
			kick_cooldown = 15;
			with instance_nearest(x,y, obj_ball) {
				if in_possession {
					in_possession = false;
					direction = point_direction(x, y, mouse_x, mouse_y);
					speed = global.current_player.kick_power;
					alarm[0] = 15;
				}
			}
		}
	
		// After Kicking
		if kick_cooldown > 0 {
			sprite_index = spr_player_kicking;
			image_index = 1;
			image_speed = 0;
			kick_cooldown -= 1;
		}
	
		// Kicking power
		if mouse_check_button(1) and obj_ball.in_possession {
			sprite_index = spr_player_kicking;
			image_index = 0;
			image_speed = 0;
			alarm[0] = 1;
		}
		else {
			kick_power = 4;
			image_speed = 1;
		}
	
		// Moving while kicking
		if mouse_check_button(1) and obj_ball.in_possession {walkspeed = 1;}
		else {walkspeed = 2;}
		
		// Tackling
		if _tackle and can_tackle and not obj_ball.in_possession {
			direction = point_direction(x, y, mouse_x, mouse_y);
			image_angle = direction;
			speed = 8;
			if hspeed > 0 {image_yscale = 1;}
			if hspeed < 0 {image_yscale = -1;}
			if image_xscale == -1 {image_xscale = 1;}
			sprite_index = spr_player_tackle;
			can_move = false;
			can_tackle = false;
			sliding = true;
		}
	}
	
	// Tackling
	if can_move == false {
		if speed > 0 {speed -= 0.5;}
		if speed == 0 {
			if can_tackle == false {
				if alarm[2] < 0 {
					alarm[2] = 15;
				}
			}
		}
	}
	
	if global.ball_scored == true or obj_game.game_stop == true{
		can_move = false
		sprite_index = spr_player_idle
	}
}


// Ai scripts
if global.current_player != id {
	switch (state) {
	    case states.ready:
	        // Code to return to home position or chase ball
	        if not obj_ball.in_possession {
				if instance_nearest(obj_ball.x, obj_ball.y, obj_player) = id {
					state = states.chase_ball;
				}
	        }
			else {state = states.go_home;}
	        break;
        
	    case states.chase_ball:
			walkspeed = 2;
			if not obj_ball.in_possession {
				// Run towards the ball
				direction = point_direction(x, y, obj_ball.x, obj_ball.y);
				speed = walkspeed;
			}
	        if (place_meeting(x, y, obj_ball)) {
	            // If they touch the ball while chasing
	            global.current_player = id;
				state = states.go_home;
	        }
			if obj_ball.in_possession {state = states.go_home;}
	        break;

	    case states.go_home:
			var adjusted_home_x = position_home_x
			var adjusted_home_y = position_home_y
			// code to make player go back to position
			move_towards_point(adjusted_home_x, adjusted_home_y, walkspeed);
	        var _dist = point_distance(x, y, adjusted_home_x, adjusted_home_y);
			if (_dist <= speed) {
			    speed = 0;
			    x = adjusted_home_x;
			    y = adjusted_home_y;
				state = states.ready;
			}
	        break;
	}
	
	if not sliding {image_angle = 0}
	
	if speed > 0 {sprite_index = spr_player_running;}
	else {sprite_index = spr_player_idle;}
	
	if hspeed > 0 {image_xscale = 1;}
	if hspeed < 0 {image_xscale = -1;}
	
}