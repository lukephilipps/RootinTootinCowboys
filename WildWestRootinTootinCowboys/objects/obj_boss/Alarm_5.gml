/// @description Insert description here
// You can write your code in this editor

if (obj_gamemanager.game_state != 0) return;

freeze_movement = false;
rushing = true;
speed_modifier = 2.4;
audio_play_sound(sfx_rush, 10, false, .8, .2, random_range(.9, 1.1));
alarm[6] = room_speed * random_range(1.5, 2);