function bot_kick(_inst){

	if _inst != 0 {
		var _distance_to_inst = point_distance(x, y, _inst.x, _inst.y)
			
		with instance_nearest(x,y, obj_ball) {
			if in_possession {
				in_possession = false;
				direction = point_direction(x, y, _inst.x, _inst.y);
				speed = 10;
				can_possess = false;
				alarm[0] = 60;
				if obj_game.kickoff == true {
					obj_game.game_start = true;
					obj_player.can_move = true;
					obj_enemy.can_move = true;
					obj_game.kickoff = false;
				}
			}
		}
		can_move = false;
		can_possess = false;
		alarm[0] = 60;
	}
}