draw_self();

if state == stateFishing {
	if face == RIGHT {
		draw_sprite(spr_bobber, 0, x + 15, y - 2)
	}
	if face == LEFT {
		draw_sprite(spr_bobber, 0, x - 15, y - 2)
	}
	if face == UP {
		draw_sprite(spr_bobber, 0, x, y - 25)
	}
	if face == DOWN {
		draw_sprite(spr_bobber, 0, x, y + 8)
	}
}