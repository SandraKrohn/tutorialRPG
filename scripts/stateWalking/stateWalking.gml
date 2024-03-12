function stateWalking() {
	// getting x and y speed
	xspd = (right_key - left_key) * move_spd;
	yspd = (down_key - up_key) * move_spd;

	// pause (preventing player movement during room transition)
	if instance_exists(obj_pauser) {
		xspd = 0;
		yspd = 0;
	}

	// set sprite
	mask_index = spriteWalking[DOWN];
	if yspd == 0 {
		if xspd > 0 {face = RIGHT};
		if xspd < 0 {face = LEFT};
	}

	if xspd > 0 && face == LEFT {
		face = RIGHT;
	}

	if xspd < 0 && face == RIGHT {
		face = LEFT;
	}

	if xspd == 0 {
		if yspd > 0 {face = DOWN};
		if yspd < 0 {face = UP};
	}

	if yspd > 0 && face == UP {
		face = DOWN;
	}

	if yspd < 0 && face == DOWN {
		face = UP;
	}

	sprite_index = spriteWalking[face];

	// collisions
	if (place_meeting(x + xspd, y, obj_wall)) == true {
		xspd = 0;
	}

	if (place_meeting(x, y + yspd, obj_wall)) == true {
		yspd = 0;
	}

	// moving player
	x += xspd;
	y += yspd;

	// no animation when idle
	if xspd == 0 && yspd == 0 {
		image_index = 0;
	}

	// depth (not really needed for a player sprite this small, but whatever, lol
	depth = -bbox_bottom;
	
	// checking for water tile
	if (f_key) {
		if face == RIGHT && (place_meeting(x + 8, y, obj_water_tile)) ||
		face == LEFT && (place_meeting(x - 8, y, obj_water_tile)) ||
		face == UP && (place_meeting(x, y - 8, obj_water_tile)) ||
		face == DOWN && (place_meeting(x, y + 8, obj_water_tile)) {
			state = stateFishing;
			alarm[0] = 5 * 60;
		}
	}
}