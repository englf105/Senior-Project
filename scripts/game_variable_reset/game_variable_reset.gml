function game_variable_reset(){
	// Game info
	global.game_font = font_add("Born2bSportyFS.otf", 12, false, false, 32, 128);
	global.current_player = 0;
	global.current_user = 0;
	global.ball_scored = false;
	obj_game.rScore = 0;
	obj_game.lScore = 0;
	obj_game.time = 0;
	randomize()

	// Game info
	starting_side = 0;
	kickoff = false;
	possession = 0
	game_stop = false;
	game_start = false;
	minute = 3;
	second_0 = "0";
	second = 0;
	f3_screen = false; // Debug settings
	message_box = false;
	message_box_text = "";
	move_on = false;
	alarm[1] = -1;
	}