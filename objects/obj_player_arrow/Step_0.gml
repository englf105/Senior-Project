// Drawing arrow above current player
if arrow = 0 {
	
	image_index = 0
	
	if instance_exists(target) {
		target = global.current_user
	}
	
	if instance_exists(target) {
		x = target.x
		y = target.y - 24
	}
}

// Drawing arrow above closest player
if arrow = 1 {
	if not obj_ball.in_possession or global.current_player.team == 2 {
		image_index = 1
		image_xscale = 1
		

		target = instance_nearest(obj_ball.x, obj_ball.y, obj_player);
		
		if instance_exists(target) {
			x = target.x
			y = target.y - 24
			
			if keyboard_check_pressed(ord("E")) {
				target = instance_nearest(obj_ball.x, obj_ball.y, obj_player);
				global.current_user = target
				obj_camera.target = global.current_user
			}
		}
	}
	else {
		image_xscale = 0
	}
}