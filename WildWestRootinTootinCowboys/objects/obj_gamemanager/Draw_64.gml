/// @description Insert description here
// You can write your code in this editor

if (game_state == 0)
{
	//draw player health
	for (var i = 0; i < obj_player.max_health; i++)
	{
		if (i + 1 <= health) draw_sprite_ext(spr_heart, 0, 70 + (i * 70), 80, 1.8, 1.8, 0, c_white, 1);
		else draw_sprite_ext(spr_heart, 0, 70 + (i * 70), 80, 1.8, 1.8, 0, c_black, .7);
	}
	
	//draw money on screen
	if (money < 50)
	{
		draw_sprite_ext(spr_coin_bronze, coin_animation, 94, 155, 2.5, 2.5, 0, c_white, 1);
	}
	else if (money < 100)
	{
		draw_sprite_ext(spr_coin_silver, coin_animation, 94, 155, 2.5, 2.5, 0, c_white, 1);
	}
	else
	{
		draw_sprite_ext(spr_coin_gold, coin_animation, 94, 155, 2.5, 2.5, 0, c_white, 1);
	}
	draw_set_font(fnt_item_desc);
	draw_set_halign(fa_left);
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_text(118, 145, "x " + string(money));
	
	//draw item desc on screen on item pickup
	if (draw_item)
	{
		draw_sprite_ext(spr_textbox, 0, view_wport[0] * .5, view_hport[0] * .82 + item_y_offset, 1, 1, 0, c_white, item_alpha);
		draw_sprite_ext(item_to_draw.sprite_index, 0, view_wport[0] * .25, view_hport[0] * .88 + item_y_offset, item_xscale, item_yscale, 0, c_white, item_alpha);
		draw_set_color(c_black);
		draw_set_alpha(item_alpha);
		draw_set_font(fnt_item_title);
		draw_text(view_wport[0] * .47, view_hport[0] * .83 + item_y_offset, item_to_draw.item_name);
		draw_set_font(fnt_item_desc);
		draw_text(view_wport[0] * .35, view_hport[0] * .87 + item_y_offset, item_to_draw.description);
	}
}
if (show_gameover)
{
	draw_set_halign(fa_center);
	draw_set_font(fnt_item_title_2);
	draw_text(view_wport[0] / 2, view_hport[0] / 2, "Game over...");
	draw_set_font(fnt_item_title);
	draw_text(view_wport[0]/ 2, view_hport[0] / 2 + 80, "Press anything to restart");
}