/// @description Insert description here
// You can write your code in this editor

if (obj_gamemanager.game_state != -1)
{
	instance_create_layer(x, y, "Instances", obj_explosion);
	audio_stop_sound(sfx_sizzle);
	instance_destroy(self);
}