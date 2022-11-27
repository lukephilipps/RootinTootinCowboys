/// @description Insert description here
// You can write your code in this editor

if (!go_down && !wait && obj_gamemanager.game_state != -1)
{
	image_yscale += .02;
	if (image_yscale > bullet_size) 
	{
		alarm[1] = 20;
		wait = true;
	}
}
else if (go_down && obj_gamemanager.game_state != -1)
{
	image_yscale -= .03;
	if (image_yscale < 0) instance_destroy(self); 
}