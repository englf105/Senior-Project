function player_tackle(_direction){
	
	//Is the current player on my team
	var _on_my_team = (global.current_player.team == id.team)
	
	// Tackling
	if can_tackle and not _on_my_team  {
		audio_play_sound(snd_slide, 10, false, 1, 0, random_range(0.8, 1.2))
		direction = _direction
		image_angle = direction;
		speed = 8;
		can_move = false;
		can_tackle = false;
		sliding = true;
	}
}