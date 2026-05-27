// Assigning which goal is which
depth = -998
goal_side = ""
if x < room_width/2 {
	goal_side = "left"
	global.goal1 = id
	}
else {
	goal_side = "right"
	global.goal2 = id
}
if goal_side == "left" {
	var _post_detail = instance_create_layer(x, y, "Instances", obj_goal_detail);
	_post_detail.depth = -1000;
	var _post = instance_create_layer(x, y, "Instances", obj_goal_post);
	_post.depth = -999;
}
if goal_side == "right" {
	image_xscale = -1
	var _post_detail = instance_create_layer(x, y, "Instances", obj_goal_detail);
	_post_detail.depth = -1000;
	var _post = instance_create_layer(x, y, "Instances", obj_goal_post);
	_post.depth = -999;
	with _post_detail {image_xscale = -1}
	with _post {image_xscale = -1}
}