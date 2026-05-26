if obj_game.rScore != 0 or obj_game.lScore != 0 {
	instance_destroy()
}
flip = false;
coin = 0;
coin_side = 0;
can_delete = false;

// For coin flip
vsp = 0;             // Vertical speed
grv = 0.3;           // Gravity strength
jump_speed = -10;     // Jump power (negative moves the character UP)
original_y = y
image_speed = 1;
image_xscale = 0;