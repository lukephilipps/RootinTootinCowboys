/// @description Insert description here
// You can write your code in this editor

image_speed = 0;
image_alpha = .5;
image_blend = c_red;
sprite_index = obj_boss.sprite_index;
image_index = obj_boss.image_index;
if (!obj_boss.facing_left) image_xscale = obj_boss.x_scale;
else image_xscale = -obj_boss.x_scale;
image_yscale = obj_boss.y_scale;
depth = obj_boss.depth + 1;

alarm[0] = 4;