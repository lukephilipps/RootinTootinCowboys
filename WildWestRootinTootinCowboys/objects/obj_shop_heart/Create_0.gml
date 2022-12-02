/// @description Insert description here
// You can write your code in this editor

depth = -y;

image_speed = 0;

sprite = spr_heart;
cost = 25;

function interact()
{
	if (obj_gamemanager.money < cost || health == obj_player.max_health) 
	{
		audio_play_sound(sfx_cancel, 10, false);
		return;
	}
	else
	{
		audio_play_sound(sfx_buy_item, 10, false);
		audio_play_sound(sfx_heal, 50, false);
		var effect = instance_create_layer(x, y, "Instances", obj_coin_disappear);
		effect.image_yscale = 3;
		effect.image_xscale = 3;
		obj_gamemanager.money -= cost;
		health++;
		instance_destroy(self);
	}
}

scale = 64 / sprite_get_height(sprite);
x_draw_pos = x;