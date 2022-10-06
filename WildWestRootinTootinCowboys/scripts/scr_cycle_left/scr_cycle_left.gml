// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_cycle_left()
{
	scr_deactivate_weapons();
	selected_weapon--;
	if (selected_weapon < 0) selected_weapon = array_length(weapons) - 1;
	weapons[selected_weapon].activate();
}