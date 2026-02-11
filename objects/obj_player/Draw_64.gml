if global.current_player == id {
	draw_sprite(spr_arrow, 0, x, y - 64)
	
	if mouse_check_button(1) {
		draw_rectangle(x + 24, y + kick_power_max - kick_power, x +33, y + 32, false)
		draw_rectangle(x + 24, y, x +33, y + 32, true)
	}
}