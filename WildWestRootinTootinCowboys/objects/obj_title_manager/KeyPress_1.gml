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