/// @description Insert description here
// You can write your code in this editor

if (health < other.max_health)
{
	audio_play_sound(sfx_heal, 50, false);
	//maybe do some effects
	health++;
	instance_destroy(self);
}