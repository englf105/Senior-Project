/// @description When the game starts

window_set_cursor(cr_none);
cursor_sprite = spr_cursor;

//spawn in ball
instance_create_layer(window_get_width()/2 ,window_get_height()/2, "Instances", obj_ball)

//spawn in player
players = []
for(i = 0 ; i < 5 ; i++ ) {
	array_push(players, instance_create_layer(1920/2 - (64 * (i + 1)), 1080/2, "Instances", obj_player))
	players[i].player = i
}

global.current_player = players[0];
global.ball_possesion = false;