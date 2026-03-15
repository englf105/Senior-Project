// Decision Making
switch (state) {
	    case enemy_states.defend:
	        // code that makes the Ai tackle the player
	        break;
        
	    case enemy_states.chase_ball:
			// code that makes the Ai go after the 
			if not obj_ball.in_possession {
				direction = point_direction(x, y, obj_ball.x, obj_ball.y)
				speed = walkspeed
			}
	        if (place_meeting(x, y, obj_ball)) {
	            // Check if player has the ball
	            global.current_player = id
				state = states.go_home
	        }
			break;

	    case enemy_states.attack:
			// code that makes the Ai shoot the ball at the goal
	        break;
		
		case enemy_states.pass:
			// code that makes the Ai pass the ball to a teammate
	        break;
			
		case enemy_states.open_up:
			// code that makes the Ai move away from their current teammate
	        break;
			
		case enemy_states.go_home:
			// code that make the Ai go back to its position
			position_home_x = room_width/2 + 64
			position_home_y = room_height/2
			move_towards_point(position_home_x, position_home_y, walkspeed)
			
	        var _dist = point_distance(x, y, position_home_x, position_home_y);
			if (_dist <= speed) {
			    speed = 0;
			    x = position_home_x;
			    y = position_home_y;
				state = states.ready
			}
	        break;
	}
	
// Animation
if speed > 0 {sprite_index = spr_player_running}
else {sprite_index = spr_player_idle}

if hspeed > 0 {image_xscale = 1}
if hspeed < 0 {image_xscale = -1}

