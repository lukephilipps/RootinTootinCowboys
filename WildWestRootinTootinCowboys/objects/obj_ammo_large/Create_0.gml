/// @description Insert description here
// You can write your code in this editor

event_inherited();

depth--;
image_xscale = .17;
image_yscale = .17;

function interact()
{
	var gun = obj_player.weapons[obj_player.selected_weapon];
	
	if (gun.infinite_ammo || gun.current_ammo == gun.max_ammo) return;
	
	gun.current_ammo = gun.max_ammo;
	gun.magazine_size_current = gun.magazine_size;
	gun.reloading = false;
	audio_play_sound(gun.reload_finish_sfx, 10, false);
	var disappear_fx = instance_create_layer(x, y, "Instances", obj_coin_disappear);
	disappear_fx.image_yscale = 2;
	disappear_fx.image_xscale = 2;
	
	instance_destroy(self);
}