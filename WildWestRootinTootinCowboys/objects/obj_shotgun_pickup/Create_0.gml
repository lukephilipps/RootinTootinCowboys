/// @description Insert description here
// You can write your code in this editor

image_xscale = 3;
image_yscale = 3;

sprite_index = spr_pump_shotgun;

event_inherited();

function interact()
{
	if (obj_gamemanager.money < cost) 
	{
		return;
	}
	else
	{
		audio_play_sound(sfx_reload_finish, 10, false);
		if (gun) x_pos = x + (bbox_right - bbox_left) / 2;
		else x_pos = x;
		var effect = instance_create_layer(x_pos, y, "Instances", obj_coin_disappear);
		effect.image_yscale = 3;
		effect.image_xscale = 3;
		obj_gamemanager.give_player_item(0);
		instance_destroy(self);
	}
}