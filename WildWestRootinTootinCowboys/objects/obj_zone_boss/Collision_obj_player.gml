/// @description Insert description here
// You can write your code in this editor

if (!activated)
{
	activated = true;
	obj_gamemanager.game_state = 1;
	obj_player.image_speed = 0;

	with (obj_enemy_parent) instance_destroy(self);
	var boss = instance_create_layer(5305, 1317, "Instances", obj_boss);
	boss.depth = -boss.y;

	instance_create_layer(5342, 2600, "Instances", obj_boss_rock);

	audio_play_sound(m_boss, 1, true);
	obj_camera_manager.focusing_boss = true;
	alarm[0] = 240;
	alarm[1] = 110;
}

if (animation_done && !stop)
{
	stop = true;
	obj_camera_manager.focusing_boss = false;
	obj_camera_manager.moving_towards_player = true;
}