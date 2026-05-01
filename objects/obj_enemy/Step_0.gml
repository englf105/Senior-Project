var _closest_teammate = instance_nearest(x, y, obj_enemy)
var _closest_enemy = instance_nearest(x, y, obj_player)
var _closest_to_ball = instance_nearest(obj_ball.x, obj_ball.y, obj_enemy)

depth = y * -1

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
				var teammate_open = collision_line(x, y, _closest_teammate.x, _closest_teammate.y, obj_player, false, false)
					
				if teammate_open {
					// Pass the ball to them
					var _dir_pass = point_direction(x, y, _closest_teammate.x, _closest_teammate.y);
					player_kick(_dir_pass);
				}
				else {
					// Am I on the right side of the field?
					if x > room_width/2 {
						// move along the y-axis away from that nearest enemy
						y -= sign(_closest_enemy.y - y) * walkspeed;
					}
					else {
						// pass the ball to the closest player to me
						var _dir_pass = point_direction(x, y, _closest_teammate.x, _closest_teammate.y);
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
	
// Animation code
if not sliding {image_angle = 0}
if speed > 0 {sprite_index = spr_enemy_running;}
else {sprite_index = spr_enemy_idle;}
if hspeed > 0 {image_xscale = 1;}
if hspeed < 0 {image_xscale = -1;}