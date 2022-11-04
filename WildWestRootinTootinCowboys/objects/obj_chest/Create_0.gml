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
	
	image_index = 1;
	
	audio_play_sound(sfx_chest, 40, false);

	//if there are items remaining
	if (array_length(obj_gamemanager.item_array) > 0)
	{
		//spawn particles
		for (var i = 0; i < 10; i++) effect_create_above(ef_star, x - 30 + irandom(60), y - 20 - irandom(20), random(2), c_white);
	
		//play item grab sound
		audio_play_sound(sfx_passive_pickup, 40, false);
	
		var index = irandom(array_length(obj_gamemanager.item_array) - 1);
		var item = obj_gamemanager.item_array[index];
		array_delete(obj_gamemanager.item_array, index, 1);
		switch (item)
		{
			case 0:
				obj_player.add_gun(instance_create_layer(0, -50, "Instances", obj_shotgun));
			break;
			case 1:
				obj_player.add_gun(instance_create_layer(0, -50, "Instances", obj_stallion));
			break;
			case 2:
				obj_player.add_gun(instance_create_layer(0, -50, "Instances", obj_tumbler));
			break;
			case 3:
				obj_player.add_gun(instance_create_layer(0, -50, "Instances", obj_brass_blaster));
			break;
			case 4:
				obj_player.add_passive_item(instance_create_layer(0, -50, "Instances", obj_cacler_flower));
			break;
			case 5:
				obj_player.add_passive_item(instance_create_layer(0, -50, "Instances", obj_eight_shooter));
			break;
			case 6:
				obj_player.add_passive_item(instance_create_layer(0, -50, "Instances", obj_omni_ammo));
			break;
		}
	}
}