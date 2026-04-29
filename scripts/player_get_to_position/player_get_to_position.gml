function player_get_to_position(){

	// Is the ball on the right side of the field?
	if obj_ball.x > room_width/2 {
		// Change x according to how far the ball is on the field
		var dist_from_center = room_width/2 - obj_ball.x
		var target_x = position_home_x - dist_from_center
		move_towards_point(target_x, y, walkspeed)
						
		var _dist = point_distance(x, y, target_x, y);
		if (_dist <= speed) {
			speed = 0;
			x = target_x;
			y = y;
		}
	}
	else {
		// Change x by a smaller amount for how far the ball is on my side
		var dist_from_center = room_width/2 - obj_ball.x
		var target_x = position_home_x - dist_from_center
		move_towards_point(target_x, y, walkspeed)
		var _dist = point_distance(x, y, target_x, y);
		if (_dist <= speed) {
			speed = 0;
			x = target_x;
			y = y;
		}
	}
}