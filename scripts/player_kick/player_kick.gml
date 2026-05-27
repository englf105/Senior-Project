function player_kick(_is_kicking){
	
	var is_current = (global.current_player == id)
	
	// Kicking
	if _is_kicking and is_current and obj_ball.in_possession {
		kick_cooldown = 15;
		with instance_nearest(x,y, obj_ball) {
			if in_possession {
				in_possession = false;
				direction = point_direction(x, y, mouse_x, mouse_y);
				speed = global.current_player.kick_power;
				alarm[0] = 15;
				flash = 3;
				audio_play_sound(snd_kick, 10, false)
				repeat (5) {
					instance_create_layer(x, y, "Instances", obj_particle)
				}
				if obj_game.kickoff == true {
					obj_game.game_start = true;
					obj_goalkeeper.can_move = true;
					obj_player.can_move = true;
					obj_enemy.can_move = true;
					obj_game.kickoff = false;
				}
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
	if mouse_check_button(1) and obj_ball.in_possession and is_current {
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
	if mouse_check_button(1) and obj_ball.in_possession and is_current {walkspeed = 1;}
	else {walkspeed = 2;}
}