has_player = false
if x < room_width/2 {side = 1}
else {side = -1}

// Info on position home x, position home y, minimum x, maximium x
ST_info = [room_width/2 - (80 * side), room_height/2, 215, 855]
RW_info = [room_width/2 - (50 * side), room_height/2 + 240, 215, 855]
LW_info = [room_width/2 - (50 * side), room_height/2 - 240, 215, 855]
CM1_info = [room_width/2 - (180 * side), room_height/2 + 100, 155, 800]
CM2_info = [room_width/2 - (180 * side), room_height/2 - 100, 155, 800]
CAM_info = [room_width/2 - (130 * side), room_height/2, 175, 825]
CDM_info = [room_width/2 - (230 * side), room_height/2, 125, 775]
CB1_info = [room_width/2 - (280 * side), room_height/2 + 100, 71, room_width]
CB2_info = [room_width/2 - (280 * side), room_height/2 - 100, 71, room_width]
FB1_info = [room_width/2 - (250 * side), room_height/2 + 240, 100, 600]
FB2_info = [room_width/2 -  (250 * side), room_height/2 - 240, 100, 600]

// Team Composition
positions = [ST_info, CAM_info, RW_info, LW_info, CM1_info, CM2_info, CB1_info, CB2_info, FB1_info, FB2_info]
