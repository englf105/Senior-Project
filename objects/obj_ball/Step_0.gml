// When the ball is moving
if speed > 0 {
	speed -= 0.75;
	if speed <= 0 {
		speed = 0;
	}
}

// If the ball is currently able to be possessed
if can_possess {
	if place_meeting(x, y, obj_player) {
		with (instance_nearest(x, y, obj_player)) {
			global.current_player = id
		}
		can_possess = false
		in_possession = true
		alarm[0] = room_speed
	}
}

// If the ball is currently in possession by a player
if in_possession {
	// Ball placement when in possession
	x = global.current_player.x + (4 * global.current_player.image_xscale) + (2 * global.current_player.hspeed)
	y = global.current_player.y + 12
	
	// Ball animations 
	if global.current_player.hspeed != 0 or global.current_player.vspeed > 0 {image_speed = 1}
	else if global.current_player.vspeed < 0 {image_speed = -1}
	else {image_speed = 0}
	
	// Direction the ball is facing
	image_xscale = global.current_player.image_xscale
	
}
else {image_speed = 0}