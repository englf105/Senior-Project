function player_tackle(_direction){
	
	//Is the current player on my team
	if global.current_player != 0 {
		var _on_my_team = (global.current_player.team == id.team)
	
		// Tackling
		if can_tackle and not _on_my_team  {
			direction = _direction
			image_angle = direction;
			speed = 8;
			can_move = false;
			can_tackle = false;
			sliding = true;
		}
	}
}