/// @description Insert description here
// You can write your code in this editor

event_inherited();

function add_additive_stats()
{
	obj_player.multishot_multiplier += 2;
	obj_player.inaccuracy += .75;
}

function add_multiplicative_stats()
{
	obj_player.damage_multiplier /= 2;
}