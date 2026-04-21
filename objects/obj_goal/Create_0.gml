// Assigning which goal is which
depth = -1000
goal_side = ""
if x < room_width/2 {goal_side = "left"}
else {goal_side = "right"}
if goal_side == "left" {
	var _post = instance_create_layer(x, y, "Instances", obj_goal_post);
}
if goal_side == "right" {
	image_xscale = -1
	var _post = instance_create_layer(x, y, "Instances", obj_goal_post);
	with _post {
		image_xscale = -1
	}
}