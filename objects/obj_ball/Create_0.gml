// Ball rules
depth = 2;
can_possess = true;
in_possession = false;
last_player = 0;
last_player_can_possess = true;
flash = 0;

// Sprite settings
image_speed = 0;

var my_shadow = instance_create_layer(x, y + 12, "Instances", obj_shadow);
my_shadow.parent = id;
my_shadow.image_index = 1;
my_shadow.y_offset = 2;