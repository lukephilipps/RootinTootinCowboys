// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_reload_gun()
{
	if (!activated || reloading || magazine_size_current == magazine_size || current_ammo == 0) return;

	reloading = true;
	reload_step_count = 0;

	if (room_speed * reload_speed < 1) alarm[1] = 1;
	else alarm[1] = room_speed * reload_speed;
}