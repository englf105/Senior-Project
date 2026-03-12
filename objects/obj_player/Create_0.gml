global.current_player = id

// Sprite settings
depth = 3
kick_cooldown = 0

// Player stats
positions = {"ST", "RW", "LW", "CM", "CAM", "CDM", "CB", "FB", "GK"} 
position = "ST";
walkspeed = 2
kick_power = 4
kick_power_max = 16

// Position
 

// Teammate Ai
enum states {
    ready,
    chase_ball,
	open_up,
    go_home
}

// Enemy Ai
enum enemy_states {
    defend,
    chase_ball,
    attack,
	pass,
	open_up,
    go_home
}

state = states.go_home;

