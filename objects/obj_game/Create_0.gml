// Sprite settings
window_set_cursor(cr_none)
cursor_sprite = spr_player_crosshair

// Score
global.ball_scored = false
global.rScore = 0
global.lScore = 0
global.time = 0
minute = 0
second_0 = "0"
second = 0

// Teams
global.team1 = instance_create_layer(x, y, "Instances", obj_team)

