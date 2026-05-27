/// @description Waiting to start kickoff
var _list = ds_list_create();
var _num = collision_circle_list(x, y, 200, obj_enemy, false, true, _list, true)
var _closest_teammate = 0
if _num > 0 {
	_closest_teammate = _list[| 0];
}

bot_kick_decision(_closest_teammate);