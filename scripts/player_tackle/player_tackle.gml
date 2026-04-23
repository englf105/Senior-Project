function player_tackle(_direction){
	// Tackling
	if can_tackle and not obj_ball.in_possession {
		direction = _direction
		image_angle = direction;
		speed = 8;
		if hspeed > 0 {image_yscale = 1;}
		if hspeed < 0 {image_yscale = -1;}
		if image_xscale == -1 {image_xscale = 1;}
		sprite_index = spr_player_tackle;
		can_move = false;
		can_tackle = false;
		sliding = true;
	}
}