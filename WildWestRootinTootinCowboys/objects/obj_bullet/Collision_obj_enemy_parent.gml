/// @description Insert description here
// You can write your code in this editor

if (!other.active) return;

//check if enemy has been hit already
for (var i = 0; i < array_length(hit_enemies); i++) {
	if (hit_enemies[i] == other) return;
}

//deal damage to enemy
other.take_damage(damage);

if (triggers_rng_effects)
	for (var i = 0; i < array_length(obj_player.passive_items); i++)
		obj_player.passive_items[i].bullet_rng_effects(self, obj_player.weapons[obj_player.selected_weapon]);

//if bullet is piercing, mark hit enemy and reduce remaining pierces
if (pierces > 0) {
	pierces--;
	array_push(hit_enemies, other);
	alarm[1] = room_speed / 2; //auto resets hit_enemies, allowing same enemy to be hit after .5 seconds
}
else {
	instance_destroy(self);
}