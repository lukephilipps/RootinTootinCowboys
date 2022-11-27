/// @description Insert description here
// You can write your code in this editor

if (obj_gamemanager.game_state == 0 || active) 
{
	depth = -y;

	//change image animation speed based on current movement speed
	image_speed = min((abs(x_movement) + abs(y_movement)) / 2, 1.2);
}
else
{
	image_speed = 0;
}