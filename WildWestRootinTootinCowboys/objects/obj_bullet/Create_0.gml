/// @description Insert description here
// You can write your code in this editor

//initialize hit_enemies to empty list
hit_enemies = [];

//destroy bullet if it hasn't been destroyed after it expires
alarm[0] = room_speed * bullet_lifetime;

//change flying speed with respect to player bullet speed
flying_speed *= obj_player.bullet_speed_multiplier;

//change damage with respect to player damage multiplier
damage *= obj_player.damage_multiplier;

//change variance with respect to player innacuracy
if (obj_player.inaccuracy < 0) variance = 0;
variance *= obj_player.inaccuracy;

//add player extra bullet bounces and pierces
bounces += obj_player.extra_bounces;
pierces += obj_player.extra_pierces;

bullet_size *= obj_player.bullet_size_multiplier;
image_xscale *= bullet_size;

//point bullet in direction of player aim and add variance to it
image_angle = point_direction(obj_player.x, obj_player.y, mouse_x, mouse_y);
image_angle += random_range(-variance, variance);

//change bullet speed to flying speed
hspeed = flying_speed * cos(degtorad(image_angle));
vspeed = -flying_speed * sin(degtorad(image_angle));

//change bullet's yscale based on direction
if (image_angle > 90 && image_angle < 270) image_yscale = -bullet_size
else image_yscale = bullet_size;