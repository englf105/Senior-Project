
draw_sprite_ext(spr_coin, -1, x, y, 2, 2, 0, c_white, 1)

if not flip {
	// Before the coin is flipped
	draw_set_font(global.game_font)
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(x, y + 48, "PRESS SPACE TO FLIP")
}

if keyboard_check_pressed(vk_space) and not flip {
	flip = true;
	vsp = jump_speed
	coin_side = choose(1, 2)
} 

if flip {
	// Apply Gravity
	vsp += grv;
}

if y + vsp > original_y {
	// When the coin stops moving
    vsp = 0;
	image_speed = 0;
	if coin_side == 1 {
		image_index = 0;
	}
	if coin_side == 2 {
		image_index = 4;
	}
}

y += vsp; // Move the player