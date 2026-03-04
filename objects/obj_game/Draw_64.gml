// Drawing Scoreboard
draw_sprite_ext(spr_scoreboard, 0, view_wport/2, 0, 2, 2, 0, c_white, 1)

// Setting Up Scores
draw_set_halign(fa_right)
draw_text_ext_transformed(view_wport/2 - 64, 10, global.rScore, 1, 64, 2, 2, 0)
draw_set_halign(fa_left)
draw_text_ext_transformed(view_wport/2 + 64, 10, global.lScore, 1, 64, 2, 2, 0)