/// @description Insert description here
// You can write your code in this editor

health_percentage = hitpoints / spawn_health * 100;

if (doing_animation)
{
	if (animation_slowing) image_speed -= .012;
	else image_speed += .012;
	if (image_speed < 0) 
	{
		image_speed = 0;
		image_index = 1;
		obj_zone_boss.animation_done = true;
	}
	else instance_create_layer(x, y, "Instances", obj_afterimage_boss);
	return;
}

if (obj_gamemanager.game_state == 0) 
{
	depth = -y;

	if (do_rush_animation)
	{
		image_speed += .02;
		if (image_speed > 4) image_speed = 4;
	}
	else image_speed = min((abs(x_movement) + abs(y_movement)) / 2, 1.2);
}
else
{
	image_speed = 0;
}