// Drawing arrow above current player

target = global.current_player
if instance_exists(target) {
	x = target.x
	y = target.y - 24
}
