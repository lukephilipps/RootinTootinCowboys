/// @description Insert description here
// You can write your code in this editor

if (show_tip && !message_shown)
{
	draw_set_font(fnt_debug);
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	draw_text(view_wport[0] / 2, view_hport[0] * 3 / 4, tip_text);
}