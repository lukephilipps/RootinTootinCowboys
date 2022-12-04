/// @description Insert description here
// You can write your code in this editor

if (obj_gamemanager.game_state != 0) return;

rushing = false;
freeze_movement = false;
do_rush_animation = false;
speed_modifier = .4;
big_attacking = false;
alarm[2] = 30;
attacks_used = 0;
audio_stop_sound(sfx_rush);