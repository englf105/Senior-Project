if room == rm_field {
	if global.goal_scored = true {
		global.start_play = false
		global.goal_scored = false
		alarm[0] = 180
	}
}