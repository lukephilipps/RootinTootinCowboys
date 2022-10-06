/// @description Insert description here
// You can write your code in this editor

event_inherited();

function interact()
{
	if (opened) return;
	
	opened = true;
	
	obj_player.add_passive_item(instance_create_layer(x, y, "Instances", obj_passive_item));
}