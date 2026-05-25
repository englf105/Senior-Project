// If the ball is in the goal
if place_meeting(x, y, obj_ball) {
	if global.ball_scored == false {
		if goal_side == "left"  {
			global.lScore += 1
			global.ball_scored = true
			obj_game.starting_side = 1
			obj_game.message_box = true;
			obj_game.message_box_text = "GOAL";
			alarm[0] = 60;
		}
		if goal_side == "right" {
			global.rScore += 1
			global.ball_scored = true
			obj_game.starting_side = 2
			obj_game.message_box = true;
			obj_game.message_box_text = "GOAL";
			alarm[0] = 60;
		}
	}
}