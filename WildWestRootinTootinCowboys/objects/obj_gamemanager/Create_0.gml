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
	9, //big iron
	10 //bomb bow
]

function give_player_item(item_num)
{
	audio_play_sound(sfx_item, 10, false);
	var item;
	var is_passive = false;
	switch (item_num)
	{
		case 0:
			item = instance_create_layer(0, -50, "Instances", obj_shotgun);
		break;
		case 1:
			item = instance_create_layer(0, -50, "Instances", obj_stallion);
		break;
		case 2:
			item = instance_create_layer(0, -50, "Instances", obj_tumbler);
		break;
		case 3:
			item = instance_create_layer(0, -50, "Instances", obj_brass_blaster);
		break;
		case 4:
			item = instance_create_layer(0, -50, "Instances", obj_cacler_flower);
			is_passive = true;
		break;
		case 5:
			item = instance_create_layer(0, -50, "Instances", obj_eight_shooter);
			is_passive = true;
		break;
		case 6:
			item = instance_create_layer(0, -50, "Instances", obj_omni_ammo);
			is_passive = true;
		break;
		case 7:
			item = instance_create_layer(0, -50, "Instances", obj_hawk);
		break;
		case 8:
			item = instance_create_layer(0, -50, "Instances", obj_desert_pepper);
			is_passive = true;
		break;
		case 9:
			item = instance_create_layer(0, -50, "Instances", obj_big_iron);
		break;
		case 10:
			item = instance_create_layer(0, -50, "Instances", obj_bomb_bow);
		break;
	}
	
	if (is_passive) obj_player.add_passive_item(item);
	else obj_player.add_gun(item);
	
	item_to_draw = item;
	
	if (is_passive)
	{
		item_xscale = 2.5;
		item_yscale = 2.5;
	}
	else
	{
		item_xscale = item.x_scale + .5;
		item_yscale = item.y_scale + .5;
	}
	item_alpha = 5;
	item_y_offset = 100;
	draw_item = true;
	alarm[0] = 4 * room_speed;
}