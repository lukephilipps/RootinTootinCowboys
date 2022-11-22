/// @description Insert description here
// You can write your code in this editor

event_inherited();

image_angle = irandom(360);
hspeed = 0;
vspeed = 0;

image_xscale = bullet_size;
image_yscale = bullet_size;

var scaling = irandom_range(-.2, .4);
image_xscale += scaling;
image_yscale += scaling;

image_speed = 0;
image_index = irandom(2);