/// @description Insert description here
// You can write your code in this editor

if (!other.active) return;

//check if enemy has been hit already
for (var i = 0; i < array_length(hit_enemies); i++) {
	if (hit_enemies[i] == other) return;
}

//deal damage to enemy
other.take_damage(self, damage);

//if bullet is piercing, mark hit enemy and reduce remaining pierces
if (pierces > 0) {
	pierces--;
	array_push(hit_enemies, other);
}
else {
	instance_destroy(self);
}