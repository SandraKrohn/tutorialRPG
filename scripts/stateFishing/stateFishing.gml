function stateFishing() {
	if (f_key) {
		state = stateWalking;
		alarm[0] = 0;
		alarm[1] = 0;
		fish_on_hook = false;
	}
	
	sprite_index = spriteFishing[face];
	if space_bar {
		alarm[0] = 0;
		alarm[1] = 0;
		
		if fish_on_hook {
			fish_counter++;
			show_message("Fish caught: " + string(fish_counter));
		}
		else {
			show_message("No fish ):");
		}
		fish_on_hook = false;
		state = stateWalking;
	}
}