/// @description Insert description here
// You can write your code in this editor

if (destroy_self) 
{
	image_alpha -= .005;
	if (image_alpha <= 0) instance_destroy(self);
}