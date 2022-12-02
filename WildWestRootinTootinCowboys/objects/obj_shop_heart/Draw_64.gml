/// @description Insert description here
// You can write your code in this editor

if (colliding_with_player && obj_gamemanager.game_state == 0)
{
	draw_set_color(c_white);
	draw_set_font(fnt_item_desc);
	draw_set_halign(fa_center);
	draw_text(x_pos, y_pos, string(cost) + "$");
}