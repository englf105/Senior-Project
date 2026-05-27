
if (room == rm_field) {
	
	if audio_is_playing(snd_cheer) {
		audio_sound_gain(snd_cheer, 0, 2000)
	}
	if (audio_sound_get_gain(snd_cheer) <= 0) {
		audio_stop_sound(snd_cheer);
		audio_sound_gain(snd_cheer, 1, 0); 
	}
	
	// Create instances that need to be created
	if not instance_exists(obj_ball) {
		instance_create_layer(room_width/2, room_height/2, "Instances", obj_ball)
	}
	
	team1 = global.team1
	team2 = global.team2
	
	if not instance_exists(obj_camera) {
		instance_create_layer(room_width/2, room_height/2, "Instances", obj_camera)
		obj_camera.target = global.current_player
	}
	
	instance_create_layer(room_width/2, room_height/2, "Instances", obj_coin)
	instance_create_layer(room_width/2, room_height/2, "Instances", obj_ball_arrow)
	
}