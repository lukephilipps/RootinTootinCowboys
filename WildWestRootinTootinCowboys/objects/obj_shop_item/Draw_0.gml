/// @description Insert description here
// You can write your code in this editor

if (colliding_with_player) 
{
	gpu_set_fog(true, c_white, 0, 1000);
	if (gun) draw_sprite_ext(sprite, 0, x_draw_pos - sprite_get_width(sprite) * scale / 15, y, scale * 1.1, scale * 1.1, 0, c_white, 1);
	else draw_sprite_ext(sprite, 0, x_draw_pos, y, scale * 1.1, scale * 1.1, 0, c_white, 1);
	gpu_set_fog(false, c_white, 0, 1000);
}
draw_sprite_ext(sprite, 0, x_draw_pos, y, scale, scale, 0, c_white, 1);