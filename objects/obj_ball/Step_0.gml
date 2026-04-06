// Depth
depth = y * -1

// Bounce off walls
if ((x <= 0) || (x >= room_width)){hspeed = -hspeed;} // Horizontal collision
if ((y <= 0) || (y >= room_height)) {vspeed = -vspeed;} // Vertical collision

// When the ball is moving
if speed > 0 {
	speed -= 0.25;
	if speed <= 0 {speed = 0;}
}

// Ball animations 
if speed > 0 {image_speed = speed}
else {image_speed = 0}
image_xscale = sign(hspeed)
if speed = 0 {image_xscale = 1}
	

// If the ball is currently able to be possessed
if can_possess {
	if place_meeting(x, y, obj_player) {
		with (instance_nearest(x, y, obj_player)) {
			global.current_player = id
		}
		can_possess = false
		in_possession = true
	}
}

// If the ball is currently in possession by a player
if in_possession {
	
	// Ball placement when in possession
	if global.current_player.can_move {
		x = global.current_player.x + (4 * global.current_player.image_xscale) + (2 * global.current_player.hspeed);
		y = global.current_player.y + 12
	}
	else if global.current_player.sliding {
		x = global.current_player.x;
		y = global.current_player.y;
		var offset = global.current_player.direction;
		
	
	}
	else {
		// If the ball is in possession but the player cannot move
		if global.current_player.speed != 0 {
			speed = global.current_player.speed;
		}
		x = global.current_player.x;
		y = global.current_player.y + 12;
	}
	
	// Ball animations 
	if global.current_player.speed > 0 {image_speed = global.current_player.speed/2;}
	else {image_speed = 0;}
	image_xscale = sign(global.current_player.hspeed);
	if global.current_player.speed = 0 or global.current_player.vspeed != 0 {image_xscale = 1;}
}

if global.ball_scored == true {
	can_possess = false;
}