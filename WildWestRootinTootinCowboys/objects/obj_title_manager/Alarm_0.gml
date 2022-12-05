/// @description Insert description here
// You can write your code in this editor

if (!wild)
{
	instance_create_layer(x, y, "Instances", obj_gun_flash);
	audio_play_sound(sfx_title_gun, 10, false, 1, .08);
	wild = true;
	alarm[0] = 60;
}
else if (!west)
{
	instance_create_layer(x, y, "Instances", obj_gun_flash);
	audio_play_sound(sfx_title_gun, 10, false, 1, .08);
	west= true;
	alarm[0] = 50;
}
else if (!rootin)
{
	instance_create_layer(x, y, "Instances", obj_gun_flash);
	audio_play_sound(sfx_title_gun, 10, false, 1, .08);
	rootin = true;
	alarm[0] = 40;
}
else if (!tootin)
{
	instance_create_layer(x, y, "Instances", obj_gun_flash);
	audio_play_sound(sfx_title_gun, 10, false, 1, .08);
	tootin = true;
	alarm[0] = 30;
}
else if (!cowboys)
{
	instance_create_layer(x, y, "Instances", obj_gun_flash);
	audio_play_sound(sfx_title_gun, 10, false, 1, .08);
	cowboys = true;
	alarm[0] = 20;
}
else if (!move_text)
{
	audio_play_sound(sfx_reload_finish, 10, false);
	move_text = true;
	alarm[0] = 80;
}
else
{
	instance_create_layer(x, y, "Instances", obj_gun_flash);
	audio_play_sound(sfx_title_gun, 10, false, 1, .08);
	show_buttons = true;
}