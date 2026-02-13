/// @description Display info

draw_text(20, 20, "has_possesion: " + string(obj_player.has_possesion))
draw_text(20, 40, "walkspeed: " + string(obj_player.walkspeed))
draw_text(20, 60, "can_possess: " + string(obj_player.can_possess))
draw_text(20, 80, "shift_key: " + string(keyboard_check(vk_shift)))
draw_text(20, 100, "x_speed: " + string(obj_player.hspeed))
draw_text(20, 120, "y_speed: " + string(obj_player.vspeed))
draw_text(20, 140, "speed: " + string(obj_player.speed))
draw_text(20, 160, "current_player: " + string(global.current_player))
draw_text(20, 180, "players: " + string(players))