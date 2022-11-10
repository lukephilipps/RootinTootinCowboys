/// @description Insert description here
// You can write your code in this editor

//select a random item
var index = irandom(array_length(obj_gamemanager.item_array) - 1);
item = obj_gamemanager.item_array[index];
array_delete(obj_gamemanager.item_array, index, 1);

image_speed = 0;
image_xscale = 3;
image_yscale = 3;

switch (item)
{
	case 0:
		sprite_index = spr_pump_shotgun;
		cost = 25;
		gun = true;
	break;
	case 1:
		sprite_index = spr_stallion;
		cost = 30;
		gun = true;
	break;
	case 2:
		sprite_index = spr_tumbler;
		cost = 50;
		gun = true;
	break;
	case 3:
		sprite_index = spr_brass_blaster;
		cost = 80;
		gun = true;
	break;
	case 4:
		sprite_index = spr_cacler_flower;
		cost = 30;
		image_xscale = 2;
		image_yscale = 2;
	break;
	case 5:
		sprite_index = spr_eight_shooter;
		cost = 30;
		image_xscale = 2;
		image_yscale = 2;
	break;
	case 6:
		sprite_index = spr_omni_ammo;
		cost = 80;
		image_xscale = 2;
		image_yscale = 2;
	break;
	case 7:
		sprite_index = spr_hawk;
		cost = 25;
		gun = true;
	break;
	case 8:
		sprite_index = spr_desert_pepper;
		cost = 30;
		image_xscale = 2;
		image_yscale = 2;
	break;
}

event_inherited();

function interact()
{
	if (obj_gamemanager.money < cost) 
	{
		return;
	}
	else
	{
		audio_play_sound(sfx_buy_item, 10, false);
		if (gun) x_pos = x + (bbox_right - bbox_left) / 2;
		else x_pos = x;
		var coin = instance_create_layer(x_pos, y, "Instances", obj_coin_disappear);
		coin.image_yscale = 3;
		coin.image_xscale = 3;
		obj_gamemanager.money -= cost;
		obj_gamemanager.give_player_item(item);
		instance_destroy(self);
	}
}