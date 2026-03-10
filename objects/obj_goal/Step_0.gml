// If the ball is in the goal
if place_meeting(x, y, obj_ball) {
	if ball_scored == false {
		if goal_side == "left"  {
			global.lScore += 1
			ball_scored = true
		}
		if goal_side == "right" {
			global.rScore += 1
			ball_scored = true
		}
	}
}