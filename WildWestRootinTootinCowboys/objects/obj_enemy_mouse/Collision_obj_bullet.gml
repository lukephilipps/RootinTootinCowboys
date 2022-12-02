/// @description Insert description here
// You can write your code in this editor

if (!active && distance_to_player < 750) 
{
	audio_play_sound(sfx_jump_out2, 1, false);
	audio_play_sound(sfx_jump_out, 1, false);
	alarm[2] = 45;
	alarm[3] = 600;
	current_ammo = 5;
	active = true;
	
	for (var i = 0; i < 10; i++)
		instance_create_layer(x, y, "Instances", obj_grass_fx);
}