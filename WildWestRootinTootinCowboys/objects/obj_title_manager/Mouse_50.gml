/// @description Insert description here
// You can write your code in this editor

if (!show_buttons)
{
	wild = true;
	west = true;
	rootin = true;
	tootin = true;
	cowboys = true;
	move_text = true;
	move_amount = 100;
	show_buttons = true;
	
	instance_create_layer(x, y, "Instances", obj_gun_flash);
	audio_play_sound(sfx_title_gun, 10, false, 1, .08);
	alarm[0] = 0;
}
else if (mouse_x < 900 && mouse_x > 700 && mouse_y < 525 && mouse_y > 475)
{
	audio_play_sound(sfx_blip, 1, false);
	draw_set_valign(fa_top);
	audio_stop_sound(m_title);
	room_goto_next();
}
else if (mouse_x < 900 && mouse_x > 700 && mouse_y < 605 && mouse_y > 555)
{
	audio_play_sound(sfx_blip, 1, false);
	game_end();
}