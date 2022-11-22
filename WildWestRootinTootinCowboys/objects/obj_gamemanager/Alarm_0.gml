/// @description Insert description here
// You can write your code in this editor

obj_player.deactivate_weapons();
instance_create_layer(0, 0, "Instances", obj_gameover_explosion);
instance_destroy(obj_player);