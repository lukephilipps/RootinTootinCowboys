/// @description Insert description here
// You can write your code in this editor

draw_set_color(c_white);
draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fnt_item_title_3);
if (wild) draw_text(room_width / 2 - 250, room_height / 2 - move_amount, "Wild");
if (west) draw_text(room_width / 2 - 145, room_height / 2 - move_amount, "West");
if (rootin) draw_text(room_width / 2 - 25, room_height / 2 - move_amount, "Rootin");
if (tootin) draw_text(room_width / 2 + 105, room_height / 2 - move_amount, "Tootin");
if (cowboys) draw_text(room_width / 2 + 260, room_height / 2 - move_amount, "Cowboys");

if (show_buttons)
{
	draw_rectangle(700, 475, 900, 525, true);
	draw_rectangle(700, 555, 900, 605, true);
	draw_text(800, 500, "Play");
	draw_text(800, 580, "Exit");
	
	if (play_selected)
	{
		draw_sprite_ext(spr_heart_cac, 0, 665, 520, .17, .17, 0, c_white, 1);
		draw_sprite_ext(spr_heart_cac, 0, 935, 520, .17, .17, 0, c_white, 1);
	}
	else
	{
		draw_sprite_ext(spr_skull, 0, 665, 590, .25, .25, 0, c_white, 1);
		draw_sprite_ext(spr_skull, 0, 935, 590, -.25, .25, 0, c_white, 1);
	}
}