/// @description Insert description here
// You can write your code in this editor

if (!active)
{
	with (obj_enemy_mouse_shotgun) 
	{
		active = true;
		alarm[2] = 30;
		alarm[3] = 600;
		current_ammo = mag_size;
	}
	alarm[2] = 45;
}