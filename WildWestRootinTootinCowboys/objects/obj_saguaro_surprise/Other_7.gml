/// @description Insert description here
// You can write your code in this editor

if (attacked) return;

attacked = true;
image_index = -1;
image_speed = 0;
instance_create_layer(x, y, "Instances", obj_saguaro_bullet);
audio_stop_sound(sfx_saguaro_bullet);
audio_play_sound(sfx_saguaro_bullet, 10, false);
alarm[0] = 45;