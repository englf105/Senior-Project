

if room = rm_field {
	// Timer
	if alarm[0] < 0 {alarm[0] = 60;}
	if second < 10 {second_0 = "0";}
	else {second_0 = ""}
	if second == 60 {
		minute += 1;
		second = 0;
	}
	if second == -1 {
		minute -= 1;
		second = 59;
	}
	if minute == 0 and second == 0 {
		game_stop = true;
	}

}