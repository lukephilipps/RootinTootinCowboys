// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_recalc_stats()
{
	fire_rate = base_fire_rate * obj_player.fire_rate_multiplier;
	reload_speed = base_reload_speed * obj_player.reload_speed_multiplier;

	//add ammo to reserves of weapons if theres a new max ammo
	current_ammo += obj_player.max_ammo_multiplier * base_max_ammo - max_ammo;
	max_ammo = obj_player.max_ammo_multiplier * base_max_ammo;
	
	//add mag size to weapon if theres a new mag size
	magazine_size_current += (obj_player.magazine_size_multiplier * base_magazine_size) - magazine_size;
	magazine_size = obj_player.magazine_size_multiplier * base_magazine_size;
	
	multishot_amount = base_multishot_amount * obj_player.multishot_multiplier;
}