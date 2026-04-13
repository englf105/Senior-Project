function player_tackle(_tackle){
	// Tackling
	if _tackle and can_tackle and not obj_ball.in_possession {
		direction = point_direction(x, y, mouse_x, mouse_y);
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