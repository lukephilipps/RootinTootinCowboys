/// @description Insert description here
// You can write your code in this editor

//destroy bullet if it hasn't been destroyed after it expires
alarm[0] = room_speed * bullet_lifetime;

image_xscale = bullet_size;

function reset_angle(angle)
{
	image_angle = angle;
	hspeed = flying_speed * cos(degtorad(image_angle));
	vspeed = -flying_speed * sin(degtorad(image_angle));
	
	if (image_angle > 90 && image_angle < 270) image_yscale = -bullet_size
	else image_yscale = bullet_size;
}