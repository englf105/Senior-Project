// Create the players on the team
if room == rm_field {
	global.current_player = 0;
	
	if obj_game.team1 == id {
		// Create the arrow for the player the user will control
		var user_arrow = instance_create_layer(x, y, "Instances", obj_player_arrow)
		
		// Create the arrow fot the second closest player
		var arrow_second = instance_create_layer(room_width/2, room_height/2, "Instances", obj_player_arrow)
		arrow_second.arrow = 1
	
		// Spawn in the players on the team
		for (var i = 0; i < 10; i += 1) {
			var player = instance_create_layer(positions[i][0], positions[i][1], "Instances", obj_player)
			player.team = 1
			player.position = positions[i]
			player.minimum_x = positions[i][2]
			player.maximum_x = positions[i][3]
			
			// Setting closest player to ball as the current player
			if global.current_player == 0 {global.current_player = player}
			if not instance_exists(obj_ball) {instance_create_layer(room_width/2, room_height/2, "Instances", obj_ball)}
			var player_dist = point_distance(player.x, player.y, obj_ball.x, obj_ball.y)
			var current_dist = point_distance(global.current_player.x, global.current_player.y, obj_ball.x, obj_ball.y)
			if player_dist <= current_dist {player = global.current_player}
		}
	}
	
	if obj_game.team2 == id {
		// Create the arrow for the player the user will control
		var user_arrow = instance_create_layer(x, y, "Instances", obj_player_arrow)
		user_arrow.team = 2
		
		// Create the arrow fot the second closest player
		var arrow_second = instance_create_layer(room_width/2, room_height/2, "Instances", obj_player_arrow)
		arrow_second.arrow = 1
	
		// Spawn in the players on the team
		for (var i = 0; i < 10; i += 1) {
			var player = instance_create_layer(positions[i][0], positions[i][1], "Instances", obj_player)
			player.team = 2
			player.position = positions[i]
			player.minimum_x = positions[i][2]
			player.maximum_x = positions[i][3]
			
			// Setting closest player to ball as the current player
			if global.current_player == 0 {global.current_player = player}
			if not instance_exists(obj_ball) {instance_create_layer(room_width/2, room_height/2, "Instances", obj_ball)}
			var player_dist = point_distance(player.x, player.y, obj_ball.x, obj_ball.y)
			var current_dist = point_distance(global.current_player.x, global.current_player.y, obj_ball.x, obj_ball.y)
			if player_dist <= current_dist {player = global.current_player}
		}
	}
}
