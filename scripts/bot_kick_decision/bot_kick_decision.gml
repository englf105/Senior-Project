function bot_kick_decision(_inst){
	kick_target = _inst;
	sprite_index = spr_enemy_kicking;
	image_index = 0;
	
	var _distance_to_inst = point_distance(x, y, _inst.x, _inst.y);
		
	if _distance_to_inst <= 75 {
		kick_power = 4
		walkspeed = 1;
		if alarm[4] < 0 {
			alarm[4] = 10;
		}
	}
	if _distance_to_inst <= 150 {
		kick_power = 8;
		if alarm[4] < 0 {
			alarm[4] = 20;
		}
		walkspeed = 1;
	}
	else {
		kick_power = 12;
		if alarm[4] < 0 {
			alarm[4] = 30;
		}
		walkspeed = 1;
	}
	
}