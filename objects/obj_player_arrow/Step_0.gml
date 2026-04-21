// Drawing arrow above current player
if arrow = 0 {
	image_index = 0
	
	if global.current_player.team == 1 {
		target = global.current_player
	}
	
	if instance_exists(target) {
		x = target.x
		y = target.y - 24
	}
}

// Drawing arrow above closest player
if arrow = 1 {
	if not obj_ball.in_possession {
		image_index = 1
		image_xscale = 1
		

		target = instance_nearest(obj_ball.x, obj_ball.y, obj_player);
		
		if instance_exists(target) {
			x = target.x
			y = target.y - 24
			
			if keyboard_check_pressed(ord("E")) {
				target = instance_nearest(obj_ball.x, obj_ball.y, obj_player);
				global.current_player = target
			}
		}
	}
	else {
		image_xscale = 0
	}
}