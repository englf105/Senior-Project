if global.current_player == id {
	if mouse_check_button(1) {
		var _barx = device_mouse_x_to_gui(0) + 14
		var _bary = device_mouse_y_to_gui(0) - 16
		draw_rectangle(_barx - 32, _bary + 64, _barx - 48 + kick_power * 5, _bary + 56, false)
		draw_rectangle(_barx - 32, _bary + 64, _barx + 32, _bary + 56, true)
	}
}

draw_text(10, 10, hspeed)
draw_text(10, 30, direction)
draw_text(10, 50, image_xscale)
draw_text(10, 70, image_yscale)