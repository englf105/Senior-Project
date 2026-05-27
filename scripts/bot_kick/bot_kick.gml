function bot_kick(){
	
	if global.current_player == id and obj_ball.in_possession {
		
		if obj_game.kickoff == true {
			obj_game.game_start = true;
			obj_player.can_move = true;
			obj_goalkeeper.can_move = true;
			obj_enemy.can_move = true;
			obj_game.kickoff = false;
		}
		
		var _ball_target = kick_target;
		var _ball_power = kick_power;
		image_index = 1;
		with obj_ball {
			in_possession = false;
		
			// Shoot the ball in a direction
			direction = point_direction(x, y, _ball_target.x, _ball_target.y);
			speed = _ball_power;
		
			// let the ball be able to be possessed in 15 frames
			can_possess = false;
			alarm[0] = 15;
		
			// Kick effects
			audio_play_sound(snd_kick, 10, false)
			repeat (5) {instance_create_layer(x, y, "Instances", obj_particle)}
			
		}
		can_move = false;
		alarm[0] = 60;
		kick_target = noone;
		walkspeed = 2;
		
	}
	else {
		walkspeed = 2;
	}
}