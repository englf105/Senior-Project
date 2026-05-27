function bot_kick_decision(_inst){
	kick_target = _inst;
	sprite_index = spr_enemy_kicking;
	image_index = 0;
	
	var _distance_to_inst = point_distance(x, y, _inst.x, _inst.y);
		
	if _distance_to_inst <= 75 {
		kick_power = 5
		walkspeed = 1;
		alarm[4] = 15;
	}
	if _distance_to_inst <= 150 {
		kick_power = 7.5;
		alarm[4] = 35;
		walkspeed = 1;
	}
	else {
		kick_power = 10;
		alarm[4] = 60;
		walkspeed = 1;
	}
	
}