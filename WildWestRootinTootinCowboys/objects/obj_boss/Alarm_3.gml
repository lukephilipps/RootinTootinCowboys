/// @description Insert description here
// You can write your code in this editor

if (obj_gamemanager.game_state != 0) return;

attacks_used++;
if (attacks_used >= irandom_range(3, 6)) alarm[4] = 30;
var dir = point_direction(x, y, obj_player.x, obj_player.y);
for (var i = 0; i <= 12; i++)
{
	var bullet = instance_create_layer(x, y, "Instances", obj_boss_bullet);
	bullet.reset_angle(dir + irandom_range(-120, 120));
}
audio_play_sound(sfx_cactus_attack, 50, false, 1, .3);