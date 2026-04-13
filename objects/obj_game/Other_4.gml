if (room == rm_field) {
	
	if not instance_exists(obj_ball) {
		instance_create_layer(room_width/2, room_height/2, "Instances", obj_ball)
	}
	instance_create_layer(room_width/2, room_height/2, "Instances", obj_ball_arrow)
	
	team1 = global.team1
	//team2 = global.team2
	
	instance_create_layer(room_width/2, room_height/2, "Instances", obj_camera)
	
}
