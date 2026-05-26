if room == rm_field {
	// Draw instruction text
	draw_set_halign(fa_left);
	draw_text(10, view_hport/2 - 60, "WASD - Move");
	draw_text(10, view_hport/2 - 40, "Click & Hold - Shoot");
	draw_text(10, view_hport/2 - 20, "Space - Tackle");

	// Drawing Scoreboard
	draw_sprite_ext(spr_scoreboard, 0, view_wport/3, 0, 2, 2, 0, c_white, 1)

	// Setting Up Time
	draw_set_halign(fa_center);
	time = string(minute) + ":" + string(second_0) + string(second);
	draw_text_ext_transformed(view_wport/3, 12, time, 1, 64, 2, 2, 0);

	// Setting Up Scores
	draw_set_halign(fa_center)
	draw_text_ext_transformed(view_wport/3 - 90, 12, obj_game.rScore, 1, 64, 2, 2, 0);
	draw_text_ext_transformed(view_wport/3 + 90, 12, obj_game.lScore, 1, 64, 2, 2, 0);
	draw_set_halign(fa_left);

	// Game box display
	if message_box == true {
		draw_set_alpha(0.5)
		draw_set_colour(c_black);
		draw_rectangle(0, view_hport/4 + 40, view_wport, view_hport/4 - 40, false);
		draw_set_colour(c_white);
		draw_set_alpha(1);
		draw_set_halign(fa_center)
		draw_text_ext_transformed(view_wport/4, view_hport/4 - 28, message_box_text, 1, 64, 3, 3, 0);
		draw_set_halign(fa_left);
	}

	if move_on == true {
		draw_set_halign(fa_center)
		draw_text_ext_transformed(view_wport/4, view_hport/4 + 100, "PRESS SPACE TO GO TO MENU", 1, 200, 2, 2, 0);
		draw_set_halign(fa_left);
	}


	// debug info
	if not f3_screen and keyboard_check_pressed(vk_f3) {f3_screen = true;}
	else if  f3_screen and keyboard_check_pressed(vk_f3) {f3_screen = false;}
	if f3_screen {
		draw_text(10, 10 , "Current_player: " + string(global.current_player));
		draw_text(10, 30 , "Current_player_x: " + string(global.current_player.x));
		draw_text(10, 50 , "Current_player_y: " + string(global.current_player.y));
		draw_text(10, 70 , "Current_player_depth: " + string(global.current_player.depth));
		draw_text(10, 90 , "Camera_instance: " + string(obj_camera.target));
		draw_text(10, 110 , "Arrow_instance: " + string(obj_player_arrow.target));
		draw_text(10, 130 , "Arrow_instance: " + string(global.current_user));
		draw_text(10, 150 , "Starting_side: " + string(global.current_player));
	}
}