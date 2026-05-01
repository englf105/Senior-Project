// Check if the target instance still exists
if (instance_exists(target)) {
	// Smoothly move the camera's x position towards the target's x position
	// The value '0.1' determines the speed (lower is slower/smoother)
	var _cam_x = camera_get_view_x(view_camera[0]);
	var _target_x = target.x - camera_get_view_width(view_camera[0]) / 2; // Center on target
	_cam_x = lerp(_cam_x, _target_x, 0.1);

	// Smoothly move the camera's y position towards the target's y position
	var _cam_y = camera_get_view_y(view_camera[0]);
	var _target_y = target.y - camera_get_view_height(view_camera[0]) / 2; // Center on target
	_cam_y = lerp(_cam_y, _target_y, 0.1);

	// Clamp camera position within room boundaries
	_cam_x = clamp(_cam_x, 0, room_width - camera_get_view_width(view_camera[0]));
	_cam_y = clamp(_cam_y, 0, room_height - camera_get_view_height(view_camera[0]));

	// Update the camera's position
	camera_set_view_pos(view_camera[0], _cam_x, _cam_y);
}