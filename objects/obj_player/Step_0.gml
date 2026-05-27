
depth = y * -1

// If this player is the current player
if global.current_user == id {
	var _up = obj_keybind.up;
	var _down = obj_keybind.down;
	var _left = obj_keybind.left;
	var _right = obj_keybind.right;
	var _click = obj_keybind.kick;
	var _tackle = obj_keybind.tackle;

	// Movement inputs
	var _hsp = _right - _left;
	var _vsp = _down - _up;

	
	if can_move {
		
		// Movement
		if obj_game.kickoff == false {
			
			hspeed = walkspeed * _hsp;
			vspeed = walkspeed * _vsp;
		}

		//Player animations
		if _up or _down or _left or _right {sprite_index = spr_player_running;}
		else {sprite_index = spr_player_idle;}

		// Direction the player is facing
		if hspeed > 0 {image_xscale = 1;}
		if hspeed < 0 {image_xscale = -1;}
		
		// Kicking
		player_kick(_click)
		
		// Tackling
		if _tackle {
			image_xscale = 1;
			var _direction = point_direction(x, y, mouse_x, mouse_y);
			player_tackle(_direction);
		}
	}
	
	// While Tackling
	if can_move == false {
		if place_meeting(x, y, obj_ball) {
			if obj_ball.in_possession {
				with global.current_player {
					can_tackle = false;
					alarm[3] = 60;
			
				}
			}
			global.current_player = id;
		}
		if speed > 0 {speed -= 0.5;}
		if speed == 0 {
			if can_tackle == false {
				if alarm[2] < 0 {
					alarm[2] = 15;
				}
			}
		}
	}
	
	if global.ball_scored == true{
		can_move = false
		sprite_index = spr_player_idle
	}

	if sliding {
		sprite_index = spr_player_tackle;
		if hspeed > 0 {
			image_index = 0;
		}
		if hspeed < 0 {
			image_xscale = -1;
			image_index = 1;
		}
	}
}


// Ai scripts
if global.current_user != id {

	var _closest_to_ball = instance_nearest(obj_ball.x, obj_ball.y, obj_player);
	
	if can_move {
		// Is the ball in possession?
		if obj_ball.in_possession {
			// Does my team have the ball?
			if global.current_player.team == 1 {
				// Do I have the ball?
				if global.current_player == id {
					global.current_user = id;
				}
				else {
					player_get_to_position()
				}
			}
			else {
				// Am I the closest player on my team to the player with the ball?
				if _closest_to_ball == id {
					// Is that player in range of being tackled?
					if point_distance(x, y, global.current_player.x, global.current_player.y) <= 30 {
						// Tackle the player
						var _enemy_direction = point_direction(x, y, global.current_player.x, global.current_player.y)
						player_tackle(_enemy_direction);
					}
					else {
						// Move towards the player
						move_towards_point_ext(global.current_player.x, global.current_player.y, walkspeed);
					}
				}
				else {
					player_get_to_position()
				}
			}
		
		}
		else {
			// Am I the closest player to the ball on my team?
			if _closest_to_ball == id {
				// Move towards ball
				move_towards_point_ext(obj_ball.x, obj_ball.y, walkspeed);
			}
			else {
				player_get_to_position()
			}	
		}
	}
	// While Tackling
	if sliding {
		if place_meeting(x, y, obj_ball) {
			if obj_ball.in_possession {
				with global.current_player {
					can_tackle = false;
					alarm[3] = 60;
			
				}
			}
			global.current_player = id;
		}
	}
	
	if not can_move {
		if speed > 0 {speed -= 0.5;}
		if speed < 0 {speed = 0;}
		if speed == 0 {
			if can_tackle == false {
				if alarm[2] < 0 {
					alarm[2] = 15;
				}
			}
		}
	}
	
	// Animation code
	if not sliding {image_angle = 0}
	if speed > 0 {sprite_index = spr_player_running;}
	else {sprite_index = spr_player_idle;}
	if hspeed > 0 {image_xscale = 1;}
	if hspeed < 0 {image_xscale = -1;}
	if sliding {
		sprite_index = spr_player_tackle;
		if hspeed > 0 {
			image_index = 0;
		}
		if hspeed < 0 {
			image_index = 1;
		}
	}
}