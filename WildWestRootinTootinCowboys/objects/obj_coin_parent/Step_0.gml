/// @description Insert description here
// You can write your code in this editor

if (obj_gamemanager.game_state == -1) {} //do nothing
else if (!follow_player) 
{
	hspeed += -sign(hspeed) / 10;
	vspeed += -sign(vspeed) / 10;
}
else
{
	movement_speed += chase_speed;
	move_towards_point(obj_player.x, obj_player.y, movement_speed);
}

depth = -y;
image_speed = abs(hspeed) + abs(vspeed);