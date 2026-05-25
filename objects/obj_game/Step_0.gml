


if kickoff {
	if starting_side != 0 and not instance_exists(obj_coin){
		if starting_side == 1 {
			var _kickoff_player = 0;
			with obj_ball {
				_kickoff_player = instance_nearest(x, y, obj_player);
			}
			_kickoff_player.x = room_width/2 - 9;
			global.current_player = _kickoff_player;
		}
		if starting_side == 2 {
			var _kickoff_enemy = 0;
			with obj_ball {
				_kickoff_enemy = instance_nearest(x, y, obj_enemy);
			}
			_kickoff_enemy.x = room_width/2 + 10;
			global.current_player = _kickoff_enemy;
		}

	}
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

if game_stop == true {
	game_start = false;
	message_box = true;
	if global.rScore > global.lScore {message_box_text = "YOU WIN";}
	else if global.rScore < global.lScore {message_box_text = "YOU LOSE";}
	else {message_box_text = "TIE";}
	obj_player.can_move = false;
	obj_player.sprite_index = spr_player_idle
	obj_enemy.can_move = false;
	obj_enemy.sprite_index = spr_enemy_idle
	obj_goalkeeper.can_move = false;
	obj_goalkeeper.sprite_index = spr_goalkeeper_idle
	if alarm[1] < 0 {
		alarm[1] = 60;
	}
	
	if keyboard_check_pressed(vk_space) and move_on {
		room_restart()
		room_goto(rm_menu);
		game_variable_reset()
	}
}
