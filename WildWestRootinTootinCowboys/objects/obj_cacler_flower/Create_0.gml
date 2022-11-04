/// @description Insert description here
// You can write your code in this editor

event_inherited();

function dash_effect()
{
	for (var i = 0; i <= 360; i += 45)
	{
		var bullet = instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_cacti_bullet);
		bullet.reset_angle(i);
	}
	audio_play_sound(sfx_cactus_attack, 5, false, .7, .3);
}