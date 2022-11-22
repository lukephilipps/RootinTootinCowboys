/// @description Insert description here
// You can write your code in this editor

event_inherited();

function enemy_death_effect(enemy_x, enemy_y)
{
	instance_create_layer(enemy_x, enemy_y, "Instances", obj_explosion);
}