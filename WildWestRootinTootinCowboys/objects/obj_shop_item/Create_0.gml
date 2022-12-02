/// @description Insert description here
// You can write your code in this editor

depth = -y;

//select a random item
var index = irandom(array_length(obj_gamemanager.item_array) - 1);
item = obj_gamemanager.item_array[index];
array_delete(obj_gamemanager.item_array, index, 1);

image_speed = 0;

switch (item)
{
	case 0:
		sprite = spr_pump_shotgun;
		cost = 25;
		gun = true;
	break;
	case 1:
		sprite = spr_stallion;
		cost = 30;
		gun = true;
	break;
	case 2:
		sprite = spr_tumbler;
		cost = 50;
		gun = true;
	break;
	case 3:
		sprite = spr_brass_blaster;
		cost = 80;
		gun = true;
	break;
	case 4:
		sprite = spr_cacler_flower;
		cost = 30;
		image_xscale = 2;
		image_yscale = 2;
	break;
	case 5:
		sprite = spr_eight_shooter;
		cost = 30;
		image_xscale = 2;
		image_yscale = 2;
	break;
	case 6:
		sprite = spr_omni_ammo;
		cost = 80;
		image_xscale = 2;
		image_yscale = 2;
	break;
	case 7:
		sprite = spr_hawk;
		cost = 25;
		gun = true;
	break;
	case 8:
		sprite = spr_desert_pepper;
		cost = 30;
		image_xscale = 2;
		image_yscale = 2;
	break;
	case 9:
		sprite = spr_big_iron;
		cost = 150;
		gun = true;
	break;
	case 10:
		sprite = spr_bomb_bow;
		cost = 60;
		gun = true;
	break;
	case 11:
		sprite = spr_spurred_boots;
		cost = 25;
	break;
	case 12:
		sprite = spr_twin_holsters;
		cost = 50;
	break;
	case 13:
		sprite = spr_gunpowder_ammo;
		cost = 100;
	break;
	case 14:
		sprite = spr_spirit_of_the_mole;
		cost = 65;
	break;
	case 15:
		sprite = spr_sniper;
		cost = 70;
		gun = true;
	break;
	case 16:
		sprite = spr_hardened_ammo;
		cost = 70;
	break;
	case 17:
		sprite = spr_piercing_ammo;
		cost = 65;
	break;
	case 18:
		sprite = spr_rubber_ammo;
		cost = 65;
	break;
	case 19:
		sprite = spr_shotgun_ammo;
		cost = 80;
	break;
}

function interact()
{
	if (obj_gamemanager.money < cost) 
	{
		audio_play_sound(sfx_cancel, 10, false);
		return;
	}
	else
	{
		audio_play_sound(sfx_buy_item, 10, false);
		if (gun) x_pos = x + (bbox_right - bbox_left) / 2;
		else x_pos = x;
		var effect = instance_create_layer(x_pos, y, "Instances", obj_coin_disappear);
		effect.image_yscale = 3;
		effect.image_xscale = 3;
		obj_gamemanager.money -= cost;
		obj_gamemanager.give_player_item(item);
		instance_destroy(self);
	}
}

scale = 64 / sprite_get_height(sprite);
x_draw_pos = gun ? x - ((sprite_get_width(sprite) * scale) / 2) : x;

//alows items not bought to be returned to the loot pool
function return_item()
{
	array_push(obj_gamemanager.item_array, item);
}