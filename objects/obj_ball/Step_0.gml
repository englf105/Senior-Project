var _player = global.current_player

if place_meeting(x,y, obj_player) {
	global.current_player = instance_nearest(x,y, obj_player)
}

if speed > 0 {
	speed -= 0.75;
	if speed <= 0 {
		speed = 0;
		global.current_player = instance_nearest(x,y, obj_player)
	}
}

if _player.has_possesion {
	
	x = _player.x + (16 * _player.x_moving)
	y = _player.y + 16 

}