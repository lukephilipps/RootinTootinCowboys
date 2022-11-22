/// @description Insert description here
// You can write your code in this editor

randomize();

audio_play_sound(m_theme, 1, true);

//window_set_fullscreen(false);

health = 6;

//create all guns and passive items
item_array = [
	//0, //shotgun
	1, //stallion
	2, //tumbler
	3, //brass blaster
	4, //cacler flower
	5, //eight shooter
	6, //omni ammo
	7, //hawk
	8, //desert pepper
	9, //big iron
	10, //bomb bow
	11, //spur boots
	12, //twin holsters
	13, //gunpowder ammo
	14, //mole spirit
	15 //sniper
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
		case 11:
			item = instance_create_layer(0, -50, "Instances", obj_spurred_boots);
			is_passive = true;
		break;
		case 12:
			item = instance_create_layer(0, -50, "Instances", obj_twin_holsters);
			is_passive = true;
		break;
		case 13:
			item = instance_create_layer(0, -50, "Instances", obj_gunpowder_ammo);
			is_passive = true;
		break;
		case 14:
			item = instance_create_layer(0, -50, "Instances", obj_mole_spirit);
			is_passive = true;
		break;
		case 15:
			item = instance_create_layer(0, -50, "Instances", obj_sniper);
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
}

function game_over_sequence()
{
	game_state = -1
	
	//freeze enemies, bullets, and player
	with (obj_enemy_parent)
	{
		image_speed = 0;
		active = false;
		depth -= 10000;
	}
	with (obj_gun)
	{
		depth -= 20000;
		image_speed = 0;
	}
	with (obj_bullet) 
	{
		depth -= 10001;
		hspeed = 0;
		vspeed = 0;
		image_speed = 0;
	}
	with (obj_enemy_bullet)
	{
		depth -= 10001;
		hspeed = 0;
		vspeed = 0;
		image_speed = 0;
	}
	obj_player.depth -= 20000;
	obj_player.image_speed = 0;
	
	audio_stop_all();
	audio_play_sound(sfx_player_damaged, 100, false);
	
	instance_create_layer(0, 0, "Instances", obj_gameover_blackout);
	
	alarm[0] = room_speed * 2;
	alarm[1] = room_speed * 4;
}