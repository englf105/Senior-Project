global.current_player = id

// Sprite settings
depth = 3
kick_cooldown = 0
can_move = true
can_tackle = true

// Player stats
team = ""
positions = ["ST", "RW", "LW", "CM", "CAM", "CDM", "CB", "FB", "GK"]
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

state = states.go_home;

