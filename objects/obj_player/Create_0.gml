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

fish_on_hook = false;
fish_counter = 0;

state = stateWalking;