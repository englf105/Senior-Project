
depth = y * -1

// If this player is the current player
if team == 1
	if global.current_player == id{
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
<<<<<<< HEAD
=======
			
			// Get the direction towards the mouse
			var _direction = point_direction(x, y, mouse_x, mouse_y);
>>>>>>> dfff2e77f2b49f639c3a00e7f43fe6d191fe60c5
		
			// Tackling
			if _tackle {
				var _direction = point_direction(x, y, mouse_x, mouse_y);
				player_tackle(_direction);
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
				var enemy_in_front = collision_line(x, y, other_goal.x, other_goal.y, nearest_inst_with(team == 1), false, false)
				
				if enemy_in_front {
					// is there a clear line to the closest teammate?
					var closest_teammate = nearest_inst_with(team == 2)
					var teammate_open = collision_line(x, y, closest_teammate.x, closest_teammate.y, obj_player, false, false)
					
					if teammate_open {
						// Pass the ball to them
						var _dir_pass = point_direction(x, y, closest_teammate.x, closest_teammate.y);
						player_kick(_dir_pass);
					}
					else {
						// Am I on the right side of the field?
						if x > room_width/2 {
							// move along the y-axis away from that nearest enemy
							var _nearest_enemy = nearest_inst_with(team == 1)
							y -= sign(_nearest_enemy.y - y) * walkspeed;
						}
						else {
							// pass the ball to the closest player to me
							var _dir_pass = point_direction(x, y, closest_teammate.x, closest_teammate.y);
							player_kick(_dir_pass);
						}
					}
				}
				else {
					// Am I in range of the goal?
					if point_distance(x, y, other_goal.x, other_goal.y) <= 100 {
						// shoot the ball at the goal
						bot_kick(other_goal);
					}
					else {
						// move towards the goal
						move_towards_point(other_goal.x, other_goal.y, walkspeed);
					}
				}
			}
			else {
				player_get_to_position()
			}
		}
		else {
			// Am I the closest player to the player with the ball?
			if instance_nearest(global.current_player.x, global.current_player.y, nearest_inst_with(team == 2)) = id {
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
				// Find the enemy closest to me
				var _enemy_to_mark = nearest_inst_with(team == 1)
				var _closest_teammate = nearest_inst_with(team == 2)
				
				// Is there a teammate closer to them?
				var _my_dist = point_distance(x, y, _enemy_to_mark.x, _enemy_to_mark.y)
				var _teammate_dist = point_distance(_closest_teammate.x, _closest_teammate.y, _enemy_to_mark.x, _enemy_to_mark.y)
				
				if _my_dist < _teammate_dist {
					// Move inbetween the guy to mark and the current player
					var _in_range = collision_circle(_enemy_to_mark.x, _enemy_to_mark.y, 50, id, false, true)
					if not _in_range {
						move_towards_point(_enemy_to_mark.x, _enemy_to_mark.y, walkspeed);
					}
					else {
						// check to see if the player will move out of range
						var next_x = _enemy_to_mark.x + hspeed;
						var next_y = _enemy_to_mark.y + vspeed;

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
		if instance_nearest(obj_ball.x, obj_ball.y, nearest_inst_with(team == 2)) = id {
			// Move towards ball
			move_towards_point(obj_ball.x, obj_ball.y, walkspeed);
		}
		else {
			player_get_to_position()
		}	
	}
}