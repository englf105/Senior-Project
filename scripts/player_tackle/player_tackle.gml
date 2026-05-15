function player_tackle(_direction){
	
	//Is the current player on my team
	var _on_my_team = (global.current_player.team == id.team)
	
	// Tackling
	if can_tackle and not _on_my_team  {
		direction = _direction
		image_angle = direction;
		speed = 8;
		if hspeed > 0 {image_yscale = 1;}
		if hspeed < 0 {image_yscale = -1;}
		if image_xscale == -1 {image_xscale = 1;}
		
		can_move = false;
		can_tackle = false;
		sliding = true;
	}
}