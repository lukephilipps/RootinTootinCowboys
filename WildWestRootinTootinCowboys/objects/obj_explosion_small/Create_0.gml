/// @description Insert description here
// You can write your code in this editor

event_inherited();

alarm[0] = 12;
effect_create_above(ef_smokeup, x, y, 2, c_gray);
audio_stop_sound(sfx_explosion);
audio_play_sound(sfx_explosion, 10, false, .8);
depth = -9999;
image_angle = 0;