/// @description Insert description here
// You can write your code in this editor

if (obj_gamemanager.game_state == -1 || obj_gamemanager.game_state == 2) return;

if (focusing_boss)
{
	var boss_x = obj_boss.x;
	var boss_y = obj_boss.y;
	
	if (point_distance(x, y, boss_x, boss_y) < 15)
	{
		hspeed = 0;
		vspeed = 0;
		if (!boss_dead) obj_boss.doing_animation = true;
	}
	else move_towards_point(boss_x, boss_y, 15);
}
else if (moving_towards_player)
{
	var player_x = obj_player.x;
	var player_y = obj_player.y;
	
	if (point_distance(x, y, player_x, player_y) < 50)
	{
		hspeed = 0;
		vspeed = 0;
		moving_towards_player = false;
		obj_boss.active = true;
		obj_boss.doing_animation = false;
		obj_boss.alarm[2] = 90;
		obj_gamemanager.game_state = 0;
		instance_destroy(obj_zone_boss);
	}
	else move_towards_point(player_x, player_y, 15);
}
else
{
	x = (mouse_x + 7 * obj_player.x) / 8;
	y = (mouse_y + 7 * obj_player.y) / 8;
}

if (shake_amount > 0) {
	x += irandom_range(-shake_strength, shake_strength);
	y += irandom_range(-shake_strength, shake_strength);
	shake_amount--;
}