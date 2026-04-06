// Draw instruction text
draw_text(10, view_hport - 70, "WASD - Move")
draw_text(10, view_hport - 50, "Click & Hold - Shoot")
draw_text(10, view_hport - 30, "Space - Tackle")

// Drawing Scoreboard
draw_sprite_ext(spr_scoreboard, 0, view_wport/2, 0, 2, 2, 0, c_white, 1)

// Setting Up Time
draw_set_halign(fa_center)
time = string(minute) + ":" + string(second_0) + string(second)
draw_text_ext_transformed(view_wport/2, 10, time, 1, 64, 2, 2, 0)

// Setting Up Scores
draw_set_halign(fa_right)
draw_text_ext_transformed(view_wport/2 - 78, 10, global.rScore, 1, 64, 2, 2, 0)
draw_set_halign(fa_left)
draw_text_ext_transformed(view_wport/2 + 78, 10, global.lScore, 1, 64, 2, 2, 0)

// debug info
if not f3_screen and keyboard_check_pressed(vk_f3) {f3_screen = true}
else if  f3_screen and keyboard_check_pressed(vk_f3) {f3_screen = false}
if f3_screen {
	draw_text(10, 10 , "Current_player: " + string(global.current_player))
	draw_text(10, 30 , "Current_player_x: " + string(global.current_player.x))
	draw_text(10, 50 , "Current_player_y: " + string(global.current_player.y))
	draw_text(10, 70 , "Current_player_depth: " + string(global.current_player.depth))
	draw_text(10, 90 , "Camera_instance: " + string(obj_camera.target))
	draw_text(10, 110 , "Arrow_instance: " + string(obj_player_arrow.target))
}