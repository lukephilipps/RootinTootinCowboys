/// @description Insert description here
// You can write your code in this editor

if (colliding_with_player)
{
	if (gun) x_pos = x - camera_get_view_x(view_camera[0]) + (bbox_right - bbox_left) / 2;
	else x_pos = x - camera_get_view_x(view_camera[0]);
	y_pos = y - camera_get_view_y(view_camera[0]) - (sprite_height / 2) - 15;
}

event_inherited();