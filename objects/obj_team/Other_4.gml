// Create the players on the team
if room == rm_field {
	if obj_game.team1 == id {
		// Create the arrow for the player the user will control
		var user_arrow = instance_create_layer(416, 360, "Instances", obj_player_arrow)
	
		var player = instance_create_layer(416, 360, "Instances", obj_player)
		player.team = 1
	}
}
