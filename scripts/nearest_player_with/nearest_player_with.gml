function nearest_player_with(_team_number){
	
	// set this to something big to begin with
	var distance = infinity;
	
	// create a variable to store the closest enemy id in
	var closest = undefined;
	
	// create a loop that will let us loop through all instances of the object
	for (var i = 0; i < instance_number(obj_player); i++){
		
		// find the instance of the object that corresponds to the value of i
		var enemy = instance_find(obj_player, i);
		var not_self = enemy != id
		
		// test if this enemy has an item
		if (obj_player.team == _team_number) && not_self {
			
			// get distance from player to enemy instance
			var dist = point_distance(id.x, id.y, enemy.x, enemy.y);
			
			// test to see if dist is closer than our previous closest distance
			if (dist < distance){
				
				// the current enemy is closer to the player than the stored one so we overwrite
				distance = dist;
				closest = enemy;
			}
		}
	}
	// return the id of the closest enemy with an item
	return closest;
}