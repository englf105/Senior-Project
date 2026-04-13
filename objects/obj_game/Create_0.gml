// Sprite settings
window_set_cursor(cr_none);
cursor_sprite = spr_player_crosshair;

// Debug settings
f3_screen = false

// Score
global.current_player = 0;
global.ball_scored = false;
global.rScore = 0;
global.lScore = 0;
global.time = 0;
game_stop = false;
minute = 6;
second_0 = "0";
second = 0;

// Objects in game
team1 = "";
team2 = "";

// Teams
global.team1 = instance_create_layer(x, y, "Instances", obj_team);
global.team2 = instance_create_layer(x, y, "Instances", obj_team);

