var _cam = view_camera[0];
var _cam_x = camera_get_view_x(_cam);
var _cam_y = camera_get_view_y(_cam);
var _cam_w = camera_get_view_width(_cam);
var _cam_h = camera_get_view_height(_cam);

// Target object to track
var _target = obj_ball; 
var _distance = 16;
var camera_x = camera_get_view_x(view_camera[0])

// Check if target is outside
if (_target.x < _cam_x || _target.x > _cam_x + _cam_w || _target.y < _cam_y || _target.y > _cam_y + _cam_h) {
    visible = true;
    
    // Position arrow on edge of viewport
    x = clamp(_target.x, _cam_x + _distance, _cam_x + _cam_w - _distance);
    y = clamp(_target.y, _cam_y + _distance, _cam_y + _cam_h - _distance);
    
    // Point at target
    image_angle = point_direction(x, y, _target.x, _target.y) + 90;
} else {
    visible = false;
}