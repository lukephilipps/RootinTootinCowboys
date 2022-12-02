/// @description Insert description here
// You can write your code in this editor

if (colliding_with_player)
{
	x_pos = x - camera_get_view_x(view_camera[0]);
	y_pos = y - camera_get_view_y(view_camera[0]) - (sprite_get_height(sprite) * scale) / 2 - 30;
}