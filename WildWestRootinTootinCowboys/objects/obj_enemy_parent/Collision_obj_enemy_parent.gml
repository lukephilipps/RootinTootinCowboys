/// @description Insert description here
// You can write your code in this editor

x_movement = 5 * speed_modifier * -cos(degtorad(point_direction(x, y, other.x, other.y)));
y_movement = 5 * speed_modifier * sin(degtorad(point_direction(x, y, other.x, other.y)));