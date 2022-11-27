/// @description Insert description here
// You can write your code in this editor

step_count++;
if (step_count == 120)
{
	if (spawn && obj_gamemanager.game_state == 0) 
	{
		audio_stop_sound(sfx_saguaro_bullet);
		audio_play_sound(sfx_saguaro_bullet, 10, false);
	}
	instance_create_layer(x, y, "Instances", obj_saguaro_bullet);
	step_count = 0;
}