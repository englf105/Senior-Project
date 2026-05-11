depth = y * -1

var top_limit = 160
var bottom_limit = 558
var right_limit = room_width/2 + (268 * side)
var left_limit = room_width/2 + (448 * side)


// If goalie is below ball
if obj_ball.y > y && obj_ball.y > top_limit
	y += walkspeed;
	
// If goalie is above ball
if obj_ball.y < y  && obj_ball.y < bottom_limit
	y -= walkspeed;

// Animation code
if side == 1 {image_xscale = 1}
if side == 2 {image_xscale = -1}
