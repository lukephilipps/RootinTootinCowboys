/// @description Insert description here
// You can write your code in this editor

if (activated) {
	x = obj_player.x;
	y = obj_player.y;
	
	depth = -y - 40;
	if (image_angle > 180) depth--;
	else depth++;
}