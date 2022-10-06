// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_recalc_weapon_stats()
{
	for (var i = 0; i < array_length(weapons); i++) weapons[i].recalc_stats();
}