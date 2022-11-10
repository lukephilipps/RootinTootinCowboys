/// @description Insert description here
// You can write your code in this editor

randomize();

//audio_play_sound(m_TempTheme, 1, true);

//window_set_fullscreen(false);

health = 6;

//create all guns and passive items
item_array = [
	0, //shotgun
	1, //stallion
	2, //tumbler
	3, //brass blaster
	4, //cacler flower
	5, //eight shooter
	6, //omni ammo
	7, //hawk
	8, //desert pepper
	9 //big iron
]

function give_player_item(item)
{
	audio_play_sound(sfx_item, 10, false);
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
		case 7:
			obj_player.add_gun(instance_create_layer(0, -50, "Instances", obj_hawk));
		break;
		case 8:
			obj_player.add_passive_item(instance_create_layer(0, -50, "Instances", obj_desert_pepper));
		break;
		case 9:
			obj_player.add_gun(instance_create_layer(0, -50, "Instances", obj_big_iron));
		break;
	}
}