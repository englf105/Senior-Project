// Sprite settings
depth = 3
kick_cooldown = 0
can_move = true

// Enemy stats
positions = ["ST", "RW", "LW", "CM", "CAM", "CDM", "CB", "FB", "GK"]
walkspeed = 2
kick_power = 4
kick_power_max = 16

// Enemy Ai states
enum enemy_states {
    defend,
    chase_ball,
    attack,
	pass,
	open_up,
    go_home
}

state = enemy_states.chase_ball;