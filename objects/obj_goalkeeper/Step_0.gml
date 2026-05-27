depth = y * -1;

var top_limit = room_height/2 - 100;
var bottom_limit = room_height/2 + 100;
var right_limit = room_width/2 + (268 * side);
var left_limit = room_width/2 + (448 * side);

if can_move {
	// If goalie is above ball
	if obj_ball.y - 5 > y {
		if y < bottom_limit {
			y += walkspeed;
			sprite_index = spr_goalkeeper_running;
		}
	}
	
	// If goalie is below ball
	if obj_ball.y + 5 < y {
		if y > top_limit {
			y -= walkspeed;
			sprite_index = spr_goalkeeper_running;
		}
	}

	var in_radius = collision_rectangle(x - 10, y - 30, x + 10, y + 30, obj_ball, false, false);

	if in_radius and can_dive {
		var _dive_direction = sign(obj_ball.y - y);
		vspeed = 6 * _dive_direction;
		can_move = false;
		can_dive = false;
		diving = true;
		alarm[0] = 60;
	
		// Animation
		sprite_index = spr_goalkeeper_dive;
		if vspeed > 0 {image_index = 1;}
		if vspeed < 0 {image_index = 0;}
	
	}
}

if diving {
	if speed > 0 {speed -= 0.5;}
	
	if speed == 0 {
		if can_dive == false {
			if alarm[0] < 0 {
				alarm[0] = 15;
			}
		}
	}
}

if place_meeting(x, y, obj_ball) {
	with obj_ball {
		direction = random_range(315, 45);
		speed = 10;
	}
}

// Animation code
if x < room_width/2 {image_xscale = 1;}
if x > room_width/2 {image_xscale = -1;}
if speed == 0 and y == new_y {sprite_index = spr_goalkeeper_idle;}
new_y = y;
