function player_kick(_is_kicking){
	
	// Kicking
	if _is_kicking and obj_ball.in_possession {
		kick_cooldown = 15;
		with instance_nearest(x,y, obj_ball) {
			if in_possession {
				in_possession = false;
				direction = point_direction(x, y, mouse_x, mouse_y);
				speed = global.current_player.kick_power;
				alarm[0] = 15;
			}
		}
	}
	
	// After Kicking
	if kick_cooldown > 0 {
		sprite_index = spr_player_kicking;
		image_index = 1;
		image_speed = 0;
		kick_cooldown -= 1;
	}
	
	// Kicking power
	if mouse_check_button(1) and obj_ball.in_possession {
		sprite_index = spr_player_kicking;
		image_index = 0;
		image_speed = 0;
		alarm[0] = 1;
	}
	else {
		kick_power = 4;
		image_speed = 1;
	}
	
	// Moving while kicking
	if mouse_check_button(1) and obj_ball.in_possession {walkspeed = 1;}
	else {walkspeed = 2;}
}