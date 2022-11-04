/// @description Insert description here
// You can write your code in this editor

event_inherited();

function add_additive_stats()
{
	obj_player.multishot_multiplier += .1;
	obj_player.bullet_size_multiplier += .3;
	obj_player.bullet_speed_multiplier += .3;
	obj_player.fire_rate_multiplier += .3;
	obj_player.damage_multiplier += .3;
	obj_player.extra_bounces += 1;
	obj_player.extra_pierces += 1;
}