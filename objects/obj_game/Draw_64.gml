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