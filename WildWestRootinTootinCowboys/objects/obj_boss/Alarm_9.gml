/// @description Insert description here
// You can write your code in this editor

if (attacks_used < 40)
{
	instance_create_layer(x + irandom_range(-50, 50), y - irandom(300), "Instances", obj_explosion);
	if (attacks_used < 30) alarm[9] = 31 - attacks_used;
	else alarm[9] = 2;
	attacks_used++;
}
else
{
	audio_play_sound(death_sfx, 10, false, 1, 0, .75);
	obj_gamemanager.game_state = 2;
	var body = instance_create_layer(x, y, "Instances", obj_enemy_body);
	body.sprite_index = spr_DeadCactus;
	body.image_xscale = image_xscale;
	body.image_yscale = image_yscale;
	obj_camera_manager.hspeed = 0;
	obj_camera_manager.vspeed = 0;
	image_alpha = 0;
	instance_create_layer(x, y, "Instances", obj_gameover_whiteout);
	alarm[10] = 180;
}
