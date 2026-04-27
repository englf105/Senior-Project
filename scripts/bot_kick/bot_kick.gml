function bot_kick(_inst){

	var _distance_to_inst = point_distance(x, y, _inst.x, _inst.y)
			
	if not kicking {
		kicking = true
				
	}
			
	if _distance_to_inst <= 25 {
		with instance_nearest(x,y, obj_ball) {
			if in_possession {
				in_possession = false;
				direction = point_direction(x, y, _inst.x, _inst.y);
				speed = global.current_player.kick_power;
				kicking = false
			}
		}
	}
	if _distance_to_inst <= 50 {}
			
	if _distance_to_inst <= 100 {}
		
	if obj_ball.in_possession and kicking {walkspeed = 1;}
	else {walkspeed = 2;}
	
	if kicking {
		sprite_index = spr_player_kicking;
		image_index = 0;
		image_speed = 0;
	}
	else {
		sprite_index = spr_player_kicking;
		image_index = 1;
		image_speed = 0;
	}
}