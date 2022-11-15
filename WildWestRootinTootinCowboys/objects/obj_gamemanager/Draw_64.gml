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
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_text(view_wport[0] - 74, 27, "x " + string(money));
	
	if (draw_item)
	{
		draw_sprite_ext(spr_textbox, 0, view_wport[0] * .5, view_hport[0] * .82 + item_y_offset, 1, 1, 0, c_white, item_alpha);
		draw_sprite_ext(item_to_draw.sprite_index, 0, view_wport[0] * .2, view_hport[0] * .83 + item_y_offset, item_xscale, item_yscale, 0, c_white, item_alpha);
		draw_set_color(c_black);
		draw_set_alpha(item_alpha);
		draw_set_font(fnt_item_title);
		draw_text(view_wport[0] * .5, view_hport[0] * .75 + item_y_offset, item_to_draw.item_name);
		draw_set_font(fnt_item_desc);
		draw_text(view_wport[0] * .35, view_hport[0] * .81 + item_y_offset, item_to_draw.description);
	}
}