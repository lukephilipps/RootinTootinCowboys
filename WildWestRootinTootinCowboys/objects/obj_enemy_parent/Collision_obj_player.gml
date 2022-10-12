/// @description Insert description here
// You can write your code in this editor

//bump enemy away from player
x_movement = 5 * speed_modifier * -cos(degtorad(move_direction));
y_movement = 5 * speed_modifier * sin(degtorad(move_direction));

if (contact_damage > 0) {
	obj_player.take_damage(contact_damage);
}