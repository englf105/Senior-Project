// Create the players on the team
if room == rm_field {
	if obj_game.team1 == id {
		// Create the arrow for the player the user will control
		var user_arrow = instance_create_layer(x, y, "Instances", obj_player_arrow)
	
		// Spawn in the players on the team
		for (var i = 0; i < 10; i += 1) {
			var player = instance_create_layer(positions[i][0], positions[i][1], "Instances", obj_player)
			player.team = 1
			player.position = positions[i]
		}
	}
}
