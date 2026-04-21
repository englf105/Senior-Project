
depth = y * -1

// If this player is the current player
if team == 1
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
	
if team == 2 {
	// Is the ball in possession?
	if obj_ball.in_possession {
		
		// Does my team have the ball?
		if global.current_player.team == 2 {
			
			// Do I have the ball?
			if global.current_player == id {
			
				// Is there a player in the way of a goal?
				var other_goal = global.goal1
				var player_in_front = collision_line(x, y, other_goal.x, other_goal.y, obj_player, false, false)
				
				if player_in_front {
					// is there a clear line to the closest teammate?
					if teammate_open {
						// Pass the ball to them
					}
					else {
						// Am I on the right side of the field?
						if x > room_width/2 {
							// move along the y-axis away from that player
						}
						else {
							// pass the ball to the farthest player from me
						}
					}
				}
				else {
					// Am I in range of the goal?
					if point_distance(x, y, other_goal.x, other_goal.y) <= 100 {
						// shoot the ball at the goal
						
					}
					else {
						// move towards the goal
						move_towards_point(other_goal.x, other_goal.y, walkspeed);
					}
				}
			}
		}
	}
	else {
		// Am I the closest player to the ball on my team?
		if instance_nearest(obj_ball.x, obj_ball.y, obj_player) = id {
			// Move towards ball
			move_towards_point(obj_ball.x, obj_ball.y, walkspeed);
		}
		else
		
	
	}
}