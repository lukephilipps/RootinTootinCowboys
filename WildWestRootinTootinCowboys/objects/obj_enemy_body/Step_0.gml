/// @description Insert description here
// You can write your code in this editor

if (destroy_self) 
{
	image_alpha -= .005;
	if (image_alpha <= 0) instance_destroy(self);
}

x += x_movement;
y += y_movement;

if (abs(x_movement > 0)) x_movement -= sign(x_movement) * .1;
else x_movement = 0;
if (abs(y_movement > 0)) y_movement -= sign(y_movement) * .1;
else y_movement = 0;