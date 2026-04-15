
depth = y * -1

// If this player is the current player
if global.current_player == id {
	var _up = keyboard_check(ord("W"));
	var _down = keyboard_check(ord("S"));
	var _left = keyboard_check(ord("A"));
	var _right = keyboard_check(ord("D"));
	var _click = mouse_check_button_released(1);
	var _tackle = keyboard_check_pressed(vk_space);

	// Movement inputs
	var _hsp = _right - _left;
	var _vsp = _down - _up;
	
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
		player_kick(_click)
		
		// Tackling
		player_tackle(_tackle)
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
			// Sets the players home position
			var adjusted_home_x = position_home_x
			var adjusted_home_y = position_home_y
			
			// Code to make player go back to position
			move_towards_point(adjusted_home_x, adjusted_home_y, walkspeed);
			
			// To prevent the player glitching
	        var _dist = point_distance(x, y, adjusted_home_x, adjusted_home_y);
			if (_dist <= speed) {
			    speed = 0;
			    x = adjusted_home_x;
			    y = adjusted_home_y;
				state = states.ready;
			}
	        break;
	}
	
	// Animation code
	if not sliding {image_angle = 0}
	if speed > 0 {sprite_index = spr_player_running;}
	else {sprite_index = spr_player_idle;}
	if hspeed > 0 {image_xscale = 1;}
	if hspeed < 0 {image_xscale = -1;}
	
}