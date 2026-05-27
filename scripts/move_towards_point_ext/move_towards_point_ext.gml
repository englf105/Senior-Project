function move_towards_point_ext(target_x, target_y, walkspeed){
	move_towards_point(target_x, target_y, walkspeed)
		
	var _dist = point_distance(x, y, target_x, target_y);
	if (_dist <= speed) {
		speed = 0;
		x = target_x;
		y = target_y;
	}
}