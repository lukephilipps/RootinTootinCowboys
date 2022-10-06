// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_cycle_right()
{
	scr_deactivate_weapons();
	selected_weapon++;
	if (selected_weapon > array_length(weapons) - 1) selected_weapon = 0;
	weapons[selected_weapon].activate();
}