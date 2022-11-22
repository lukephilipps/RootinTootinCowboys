/// @description Insert description here
// You can write your code in this editor

event_inherited();

alarm[0] = 12;
effect_create_above(ef_smokeup, x, y - 10, 2, c_gray);
effect_create_above(ef_smokeup, x + 30, y + 10, 2, c_gray);
effect_create_above(ef_smokeup, x - 30, y + 10, 2, c_gray);
audio_stop_sound(sfx_explosion);
audio_play_sound(sfx_explosion, 10, false);
obj_camera_manager.add_shake(10);
depth = -9900;
image_angle = 0;