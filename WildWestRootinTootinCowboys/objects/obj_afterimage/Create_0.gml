/// @description Insert description here
// You can write your code in this editor

image_speed = 0;
image_alpha = .5;
image_blend = c_aqua;
sprite_index = obj_player.sprite_index;
image_index = obj_player.image_index;
if (!obj_player.facing_left) image_xscale = obj_player.x_scale;
else image_xscale = -obj_player.x_scale;
image_yscale = obj_player.y_scale;
depth = obj_player.depth + 1;

alarm[0] = 4;