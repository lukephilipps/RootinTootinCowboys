/// @description Insert description here
// You can write your code in this editor

audio_play_sound(sfx_coin, 1, false);
obj_gamemanager.money += value;
var coin = instance_create_layer(x, y, "Instances", obj_coin_disappear);
coin.image_yscale = image_yscale;
coin.image_xscale = image_xscale;
instance_destroy(self);