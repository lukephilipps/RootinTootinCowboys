/// @description Insert description here
// You can write your code in this editor

if (game_state == 0)
{
	if (money < 50)
	{
		draw_sprite_ext(spr_coin_bronze, 0, view_wport[0] - 97, 35, 2, 2, 0, c_white, 1);
	}
	else if (money < 100)
	{
		draw_sprite_ext(spr_coin_silver, 0, view_wport[0] - 97, 35, 2, 2, 0, c_white, 1);
	}
	else
	{
		draw_sprite_ext(spr_coin_gold, 0, view_wport[0] - 97, 35, 2, 2, 0, c_white, 1);
	}
	draw_set_font(fnt_debug);
	draw_set_halign(fa_left);
	draw_text(view_wport[0] - 74, 27, "x " + string(money));
}