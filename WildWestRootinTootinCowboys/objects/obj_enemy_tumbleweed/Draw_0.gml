/// @description Insert description here
// You can write your code in this editor

if (took_damage) {
	gpu_set_fog(true, c_white, 0, 1000);
	draw_sprite_ext(spr_tumbleweed_2, 0, x, y, x_scale, y_scale, angle, 0xFFFFFE, 1);
	gpu_set_fog(false, c_white, 0, 1000);
}
else {
	draw_sprite_ext(spr_tumbleweed_2, 0, x, y, x_scale, y_scale, angle, c_white, 1);
}

if (facing_left) draw_sprite_ext(spr_tumbleweed_1, 0, x, y, -x_scale, y_scale, 0, c_white, 1);
else draw_sprite_ext(spr_tumbleweed_1, 0, x, y, x_scale, y_scale, 0, c_white, 1);