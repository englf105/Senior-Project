
var _list = ds_list_create();
var _num = collision_circle_list(x, y, 200, obj_enemy, false, true, _list, true)

var _closest_teammate = 0
if _num > 0 {
	
	_closest_teammate = _list[| 0];
	
}

var _closest_enemy = instance_nearest(x, y, obj_player)
var _closest_to_ball = instance_nearest(obj_ball.x, obj_ball.y, obj_enemy)

depth = y * -1

if can_move {
	// Is the ball in possession?
	if obj_ball.in_possession {
		// Does my team have the ball?
		if global.current_player.team == 2 {
			// Do I have the ball?
			if global.current_player == id {
				// Is there a player in the way of a goal?
				var other_goal = global.goal1
				var player_in_front = collision_line(x, y, other_goal.x, other_goal.y, obj_player, false, false)
				
				if player_in_front != noone {
					// is there a clear line to the closest teammate?
					if instance_exists(_closest_teammate) {
						var teammate_open = collision_line(x, y, _closest_teammate.x, _closest_teammate.y, obj_player, false, false)
					
						if teammate_open != noone {
							// Pass the ball to them
							bot_kick(_closest_teammate);
						}
						else {
							// Am I on the right side of the field?
							if x > room_width/2 {
								// move along the y-axis away from that nearest enemy
								y -= sign(_closest_enemy.y - y) * walkspeed;
							}
							else {
								// pass the ball to the closest player to me
								bot_kick(_closest_teammate);
							}
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
						move_towards_point_ext(other_goal.x, other_goal.y, walkspeed);
					}
				}
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

// If kickoff
if global.current_player == id and kickoff_start == false {
	if not can_move and obj_game.kickoff = true{
		kickoff_start = true;
		alarm[1] = 60;
	}
}

// Animation code
if not sliding {image_angle = 0}
if speed > 0 {sprite_index = spr_enemy_running;}
else {sprite_index = spr_enemy_idle;}
if hspeed > 0 {image_xscale = 1;}
if hspeed < 0 {image_xscale = -1;}
if sliding {
		sprite_index = spr_enemy_tackle;
		if hspeed > 0 {
			image_index = 0;
		}
		if hspeed < 0 {
			image_index = 1;
		}
	}