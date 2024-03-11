xspd = 0;
yspd = 0;
move_spd = 1;

spriteWalking[RIGHT] = spr_player_right
spriteWalking[UP] = spr_player_up
spriteWalking[LEFT] = spr_player_left
spriteWalking[DOWN] = spr_player_down

spriteFishing[RIGHT] = spr_player_fishing_right
spriteFishing[UP] = spr_player_fishing_up
spriteFishing[LEFT] = spr_player_fishing_left
spriteFishing[DOWN] = spr_player_fishing_down

face = DOWN

stateWalking = function() {
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

	// depth (not needed for a player sprite this small, but whatever, lol
	depth = -bbox_bottom;
	
	// checking for water tile
	if (f_key) {
		if face == RIGHT && (place_meeting(x + 8, y, obj_water_tile)) ||
		face == LEFT && (place_meeting(x - 8, y, obj_water_tile)) ||
		face == UP && (place_meeting(x, y - 8, obj_water_tile)) ||
		face == DOWN && (place_meeting(x, y + 8, obj_water_tile)) {
			state = stateFishing;
		}
	}
}

// fishing, the most important part of a game
stateFishing = function() {	
	if (f_key) {
		state = stateWalking;
	}
	
	sprite_index = spriteFishing[face];
	// add spr_bobber on tile in front of player
}

state = stateWalking;