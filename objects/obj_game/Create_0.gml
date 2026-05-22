// Sprite settings
window_set_cursor(cr_none);
cursor_sprite = spr_player_crosshair;

// Game info
global.game_font = font_add("Born2bSportyFS.otf", 12, false, false, 32, 128);
global.current_player = 0;
global.current_user = 0;
global.ball_scored = false;
global.rScore = 0;
global.lScore = 0;
global.time = 0;
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
team1 = "";
team2 = "";
f3_screen = false; // Debug settings

// Teams
global.team1 = instance_create_layer(room_width/2 - 10, y, "Instances", obj_team);
global.team2 = instance_create_layer(room_width/2 + 10, y, "Instances", obj_team);

