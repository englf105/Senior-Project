if global.current_player == id {
	if mouse_check_button(1) {
		
		// Power bar size
		var _bar_width = 64;
		var _bar_height = 8;
		
		// Where the bar is placed
		var _barx = device_mouse_x_to_gui(0) - _bar_width/2;
		var _bary = device_mouse_y_to_gui(0) + 16; // distance down from mouse
		
		// Outline Rectangle
		draw_rectangle(_barx, _bary, _barx + _bar_width, _bary + _bar_height, true);
		
		var filled_width = ((kick_power - kick_power_original) / (kick_power_max - kick_power_original)) * _bar_width;
		
		// Inside Rectangle
		draw_rectangle(_barx, _bary, _barx + filled_width, _bary + _bar_height, false);
		
	}
}