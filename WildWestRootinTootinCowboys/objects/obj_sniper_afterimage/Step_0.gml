/// @description Insert description here
// You can write your code in this editor

image_yscale -= sign(image_yscale) * .4;
if (abs(image_yscale) <= 0.4) instance_destroy(self);