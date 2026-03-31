// Decreases kicking power the longer the button is held
if kick_power < kick_power_max {
	kick_power += 1/4;
}