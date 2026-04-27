// Sprite settings
depth = 3
kick_cooldown = 0
can_move = true
can_tackle = true
sliding = false
kicking = false

// Player stats
team = ""
position = ""
position_home_x = x
position_home_y = y
minimum_x = 0
maximum_x = 0
walkspeed = 2
kick_power = 2
kick_power_original = kick_power
kick_power_max = 12

// Teammate Ai
enum states {
    ready,
    chase_ball,
    go_home,
}

state = states.go_home;

