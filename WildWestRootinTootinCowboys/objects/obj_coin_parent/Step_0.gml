/// @description Insert description here
// You can write your code in this editor

if (!follow_player) 
{
	hspeed += -sign(hspeed) / 10;
	vspeed += -sign(vspeed) / 10;
}
else if (obj_gamemanager.game_state != -1)
{
	movement_speed += chase_speed;
	move_towards_point(obj_player.x, obj_player.y, movement_speed);
}

image_speed = abs(hspeed) + abs(vspeed);