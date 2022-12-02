/// @description Insert description here
// You can write your code in this editor

depth = -y;

image_speed = 0;

sprite = spr_ammo_large;
cost = 40;

function interact()
{
	if (obj_gamemanager.money < cost) 
	{
		audio_play_sound(sfx_cancel, 10, false);
		return;
	}
	else
	{
		var gun = obj_player.weapons[obj_player.selected_weapon];
	
		if (gun.infinite_ammo || gun.current_ammo + gun.magazine_size_current == gun.max_ammo + gun.magazine_size ) 
		{
			audio_play_sound(sfx_cancel, 10, false);
			return;
		}
	
		gun.current_ammo = gun.max_ammo;
		gun.magazine_size_current = gun.magazine_size;
		gun.reloading = false;
		audio_play_sound(sfx_buy_item, 10, false);
		audio_play_sound(gun.reload_finish_sfx, 10, false);
		var disappear_fx = instance_create_layer(x, y, "Instances", obj_coin_disappear);
		disappear_fx.image_yscale = 2;
		disappear_fx.image_xscale = 2;
		obj_gamemanager.money -= cost;
	
		instance_destroy(self);
	}
}

scale = 64 / sprite_get_height(sprite);
x_draw_pos = x;