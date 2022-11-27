/// @description Insert description here
// You can write your code in this editor

if (obj_gamemanager.game_state == 0 && active)
{	
	recoil_angle = 10;
	for (var i = 0; i < 6; i++)
	{
		var bullet = instance_create_layer(x + (90 * cos(degtorad(move_direction))), y - 36 - (90 * sin(degtorad(move_direction))), "Instances", obj_enemy_bullet3);
		bullet.reset_angle(move_direction);
	}
	audio_play_sound(sfx_gun_shotgun, 50, false);
}

if (current_ammo > 0) 
{
	current_ammo--;
	alarm[2] = 50;
}
else 
{
	if (obj_gamemanager.game_state == 0 && active) audio_play_sound(sfx_reload_start, 50, false);
	alarm[3] = room_speed * reload_speed;
}