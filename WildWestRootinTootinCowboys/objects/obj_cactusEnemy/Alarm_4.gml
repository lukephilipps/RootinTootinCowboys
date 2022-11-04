/// @description Insert description here
// You can write your code in this editor

for (var i = 0; i <= 360; i += 45)
{
	var bullet = instance_create_layer(x, y, "Instances", obj_enemy_bullet);
	bullet.reset_angle(i);
}