
if starting_side != 0 and not instance_exists(obj_coin) and not kickoff {
	if starting_side == 1 {
		var _kickoff_player = 0;
		with obj_ball {
			_kickoff_player = instance_nearest(x, y, obj_player);
		}
		_kickoff_player.x = room_width/2 - 9;
		global.current_player =_kickoff_player;
		kickoff = true;
	}
	if starting_side == 2 {
		var _kickoff_enemy = 0;
		with obj_ball {
			_kickoff_enemy = instance_nearest(x, y, obj_enemy);
		}
		_kickoff_enemy.x = room_width/2 + 10;
		global.current_player =_kickoff_enemy;
		kickoff = true;
	}

}

if game_start == true {
	obj_player.can_move = true;
	obj_enemy.can_move = true;
}

if room = rm_field and game_start {
	// Timer
	if alarm[0] < 0 {alarm[0] = 60;}
	if second < 10 {second_0 = "0";}
	else {second_0 = ""}
	if second == 60 {
		minute += 1;
		second = 0;
	}
	if second == -1 {
		minute -= 1;
		second = 59;
	}
	if minute == 0 and second == 0 {
		game_stop = true;
	}

}