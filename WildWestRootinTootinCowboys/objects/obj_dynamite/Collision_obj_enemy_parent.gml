/// @description Insert description here
// You can write your code in this editor

if (!other.active) return;

//deal damage to enemy
other.take_damage(damage);

instance_create_layer(x, y, "Instances", obj_explosion);
audio_stop_sound(sfx_sizzle);
instance_destroy(self);