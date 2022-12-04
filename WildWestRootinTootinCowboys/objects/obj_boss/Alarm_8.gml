/// @description Insert description here
// You can write your code in this editor

if (obj_gamemanager.game_state != 0) return;

var enemy = instance_create_layer(x - 150, y, "Instances", obj_enemy_cactus);
enemy.image_yscale = .3;
enemy.money_amount = 0;
enemy.image_xscale = enemy.x_scale;
var enemy = instance_create_layer(x + 150, y, "Instances", obj_enemy_cactus);
enemy.image_yscale = .3;
enemy.money_amount = 0;
enemy.image_xscale = enemy.x_scale;

effect_create_above(ef_smokeup, x - 150, y - 30, 2, c_white);
effect_create_above(ef_smokeup, x - 135, y, 2, c_white);
effect_create_above(ef_smokeup, x - 165, y, 2, c_white);
effect_create_above(ef_smokeup, x + 135, y, 2, c_white);
effect_create_above(ef_smokeup, x + 150, y - 30, 2, c_white);
effect_create_above(ef_smokeup, x + 165, y, 2, c_white);