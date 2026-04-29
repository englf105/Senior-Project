function nearest_inst_with(_condition){
	function nearest_inst_with(_condition) {
	var n = noone;
	var d, t; // d for closest distance, t for check distance.
	var instance_calling = id
	with obj_player {
	    if team == 1 and obj_player != instance_calling{
	        t = point_distance(x, y, other.x, other.y);
	        if n == noone or t < d { // If distance is less than current target distance, then apply new distance and instance id.
	            d = t;
	            n = id;
	        }
	    }
	}
	return n;
}
}