/// @description Insert description here
// You can write your code in this editor

for (var i = 0; i < 20; i++)
{
	instance_create_layer(x + irandom_range(-100, 100), y + irandom_range(-100, 100), "Foliage", obj_Grass);
}