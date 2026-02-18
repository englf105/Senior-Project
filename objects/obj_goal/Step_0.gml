
// If the ball is in the goal
if place_meeting(x, y, obj_ball) {
	if goal_side == "left" {
		global.lScore += 1
		global.goal_scored = true
	}
	else if goal_side == "right" {
		global.rScore += 1
		global.goal_scored = true
	}
	alarm[0] = 60;
}