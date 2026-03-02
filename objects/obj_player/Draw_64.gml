if global.current_player == id {
	if mouse_check_button(1) {
		var _width = mouse_x + 2
		var _height = mouse_y + 2
		draw_rectangle(_width - 32, _height + 64, _width - 48 + kick_power * 5, _height + 56, false)
		draw_rectangle(_width - 32, _height + 64, _width + 32, _height + 56, true)
	}
}