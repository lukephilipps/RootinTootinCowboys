/// @description Insert description here
// You can write your code in this editor

image_speed = 0;
image_xscale = 6;
image_yscale = 6;

event_inherited();

function interact()
{
	if (opened) return;
	
	opened = true;
	
	for (var i = 0; i < 10; i++) effect_create_above(ef_star, x - 30 + irandom(60), y - 20 - irandom(20), random(2), c_white);
	
	image_index = 1;
	
	obj_player.add_passive_item(instance_create_layer(0, -50, "Instances", obj_cacler_flower));
}