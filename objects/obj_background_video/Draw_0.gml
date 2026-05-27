var _videoData = video_draw();
var _videoStatus = _videoData[0];

if _videoStatus == 0 {
	draw_surface_ext(_videoData[1], 0, 0, 1, 1, 0, c_white, 1);
}