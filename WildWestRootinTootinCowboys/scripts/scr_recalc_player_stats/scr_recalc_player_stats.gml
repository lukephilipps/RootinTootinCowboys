// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_recalc_player_stats()
{
	//change to base stats
	movement_speed = 5;
	inaccuracy = 1;
	damage_multiplier = 1;
	bullet_speed_multiplier = 1;
	reload_speed_multiplier = 1;
	magazine_size_multiplier = 1;
	max_ammo_multiplier = 1;
	bullet_size_multiplier = 1;
	multishot_multiplier = 1;
	fire_rate_multiplier = 1;
	
	//add additive items first
	for (var i = 0; i < array_length(passive_items); i++) {
		passive_items[i].add_additive_stats();
	}
	//add multiplicative items second
	for (var i = 0; i < array_length(passive_items); i++) {
		passive_items[i].add_multiplicative_stats();
	}
	
	scr_recalc_weapon_stats();
}