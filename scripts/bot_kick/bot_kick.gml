function bot_kick(_inst){
	
	
	var _distance_to_inst = point_distance(x, y, _inst.x, _inst.y)
	
	var _ball_speed = 0
		
	if _distance_to_inst <= 20 {
		_ball_speed = 5
	}
	if _distance_to_inst <= 50 {
		_ball_speed = 7.5
	}
	if _distance_to_inst <= 100 {
		_ball_speed = 10
	}
		
	if obj_game.kickoff == true {
		obj_game.game_start = true;
		obj_player.can_move = true;
		obj_goalkeeper.can_move = true;
		obj_enemy.can_move = true;
		obj_game.kickoff = false;
	}
		
	with obj_ball {
		in_possession = false;
		direction = point_direction(x, y, _inst.x, _inst.y);
		speed = _ball_speed;
		can_possess = false;
		alarm[0] = 15;
	}
	can_move = false;
	can_possess = false;
	alarm[0] = 60;
}