function player_get_to_position(){
	// Am I on the right side of the field?
	if team == 2 {
		if x > room_width/2 {
			// Change x according to how far the ball is on the field
			var ball_dist = obj_ball.x + room_width/2
			var target_dist = position_home_x - ball_dist
			if x < target_dist {
				move_towards_point(target_dist, position_home_y, walkspeed);
				// To prevent the player glitching
				var _dist = point_distance(x, y, target_dist, position_home_y);
				if (_dist <= speed) {
					speed = 0;
					x = target_dist;
					y = position_home_y;
				}
			}
		}
		else {
			// if the ball is on our side, squeeze the formation
			var ball_dist = obj_ball.x - room_width/2
			var target_dist = position_home_x - (ball_dist / 2)
			if x < target_dist {
				move_towards_point(target_dist, position_home_y, walkspeed);
				// To prevent the player glitching
				var _dist = point_distance(x, y, target_dist, position_home_y);
				if (_dist <= speed) {
					speed = 0;
					x = target_dist;
					y = position_home_y;
				}
			}
		}
	}
}