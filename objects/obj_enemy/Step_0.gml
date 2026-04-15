switch (state) {
	case enemy_states.ready:
	    // Code to return to home position or chase ball
	    if not obj_ball.in_possession and obj_game.possession == obj_game.team2 {
			if instance_nearest(obj_ball.x, obj_ball.y, obj_player) = id {
				state = states.chase_ball;
			}
	    }
		else {state = states.go_home;}
	    break;
        
	case enemy_states.chase_ball:
		walkspeed = 2;
		if not obj_ball.in_possession {
			// Run towards the ball
			direction = point_direction(x, y, obj_ball.x, obj_ball.y);
			speed = walkspeed;
		}
	    if (place_meeting(x, y, obj_ball)) {
	        // If they touch the ball while chasing
	        global.current_player = id;
			obj_game.possession = obj_game.team2
			state = states.go_home;
	    }
		if obj_ball.in_possession {state = states.go_home;}
	    break;

	case enemy_states.go_home:
		// Sets the players home position
		var adjusted_home_x = position_home_x
		var adjusted_home_y = position_home_y
			
		// Code to make player go back to position
		move_towards_point(adjusted_home_x, adjusted_home_y, walkspeed);
			
		// To prevent the player glitching
	    var _dist = point_distance(x, y, adjusted_home_x, adjusted_home_y);
		if (_dist <= speed) {
			speed = 0;
			x = adjusted_home_x;
			y = adjusted_home_y;
			state = states.ready;
		}
	    break;
}