
depth = y * -1

// If this player is the current player
if global.current_user == id {
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
		if _tackle {
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
	
	if global.ball_scored == true or obj_game.game_stop == true{
		can_move = false
		sprite_index = spr_player_idle
	}

	if sliding {sprite_index = spr_player_tackle;}
}


// Ai scripts
if global.current_user != id {
	
	var _closest_teammate = instance_nearest(x, y, obj_player);
	var _closest_enemy = instance_nearest(x, y, obj_enemy);
	var _closest_to_ball = instance_nearest(obj_ball.x, obj_ball.y, obj_player);
	
	if can_move {
		// Is the ball in possession?
		if obj_ball.in_possession {
			// Does my team have the ball?
			if global.current_player.team == 1 {
				// Do I have the ball?
				if global.current_player == id {
					global.current_user = id;
					obj_camera.target = id
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
						move_towards_point(global.current_player.x, global.current_player.y, walkspeed);
					}
				}
				else {
				
					// Is there a teammate closer to them?
					var _my_dist = point_distance(x, y, _closest_enemy.x, _closest_enemy.y)
					var _teammate_dist = point_distance(_closest_teammate.x, _closest_teammate.y, _closest_enemy.x, _closest_enemy.y)
				
					if _my_dist < _teammate_dist {
						// Move inbetween the guy to mark and the current player
						var _in_range = collision_circle(_closest_enemy.x, _closest_enemy.y, 50, id, false, true)
						if not _in_range {
							move_towards_point(_closest_enemy.x, _closest_enemy.y, walkspeed);
						}
						else {
							// check to see if the player will move out of range
							var next_x = _closest_enemy.x + hspeed;
							var next_y = _closest_enemy.y + vspeed;

							// Check if there is NO collision at the next position
							if collision_circle(next_x, next_y, 50, id, false, true) {
								move_towards_point(global.current_player.x, global.current_player.y, walkspeed);
							}
						}
					}
					else {
						player_get_to_position()
					}
				}
			}
		
		}
		else {
			// Am I the closest player to the ball on my team?
			if _closest_to_ball == id {
				// Move towards ball
				move_towards_point(obj_ball.x, obj_ball.y, walkspeed);
			}
			else {
				player_get_to_position()
			}	
		}
	}
	// While Tackling
	else{
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
	
	
	// Animation code
	if not sliding {image_angle = 0}
	if speed > 0 {sprite_index = spr_player_running;}
	else {sprite_index = spr_player_idle;}
	if hspeed > 0 {image_xscale = 1;}
	if hspeed < 0 {image_xscale = -1;}
	if sliding {sprite_index = spr_player_tackle;}
}