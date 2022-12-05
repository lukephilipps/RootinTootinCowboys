/// @description Insert description here
// You can write your code in this editor

draw_set_color(c_white);
draw_set_alpha(1);
draw_set_halign(fa_center);

draw_set_font(fnt_item_title_3);
draw_text(room_width / 2, room_height + 50 - text_pos, "Wild West Rootin Tootin Cowboys");

draw_set_font(fnt_item_title);
draw_text(room_width / 2, room_height + 450 - text_pos, "Gameplay Programmer");
draw_set_font(fnt_item_title_2);
draw_text(room_width / 2, room_height + 490 - text_pos, "Luke Philipps");

draw_set_font(fnt_item_title);
draw_text(room_width / 2, room_height + 620 - text_pos, "Game Art and Enemy Design");
draw_set_font(fnt_item_title_2);
draw_text(room_width / 2, room_height + 660 - text_pos, "Leon Shen");
draw_text(room_width / 2, room_height + 710 - text_pos, "Frank Valenzuela");

draw_set_font(fnt_item_title);
draw_text(room_width / 2, room_height + 840 - text_pos, "Sound Design and Composition");
draw_set_font(fnt_item_title_2);
draw_text(room_width / 2, room_height + 880 - text_pos, "Miguel Thompson");
draw_text(room_width / 2, room_height + 930 - text_pos, "Ian Pelczarski");

draw_set_font(fnt_item_title);
draw_text(room_width / 2, room_height + 1060 - text_pos, "Item Design");
draw_set_font(fnt_item_title_2);
draw_text(room_width / 2, room_height + 1100 - text_pos, "Lucas Garner");

draw_set_font(fnt_item_title);
draw_text(room_width / 2, room_height + 1300 - text_pos, "Thanks everyone for a great semester.");

if (draw_thanks)
{
	draw_set_font(fnt_item_title_2);
	draw_text(room_width / 2, room_height / 2, "Thanks for Playing");
}
if (draw_press)
{
	draw_set_font(fnt_item_title);
	draw_text(room_width / 2, room_height / 2 + 80, "Press anything to restart");
}