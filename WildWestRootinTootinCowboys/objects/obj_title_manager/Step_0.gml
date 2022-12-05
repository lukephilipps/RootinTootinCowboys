/// @description Insert description here
// You can write your code in this editor

if (move_text && move_amount < 100) move_amount += 5;

if (mouse_x < 900 && mouse_x > 700 && mouse_y < 525 && mouse_y > 475 && !play_selected && show_buttons)
{
	audio_play_sound(sfx_blip2, 1, false);
	play_selected = true;
}
else if (mouse_x < 900 && mouse_x > 700 && mouse_y < 605 && mouse_y > 555 && play_selected && show_buttons)
{
	audio_play_sound(sfx_blip2, 1, false);
	play_selected = false;
}