/// @description Insert description here
// You can write your code in this editor

event_inherited();

function dash_effect()
{
	spawning_spikes = true;
	alarm[0] = room_speed * obj_player.dash_time;
	audio_play_sound(sfx_passive_pickup, 1, false, .7);
}