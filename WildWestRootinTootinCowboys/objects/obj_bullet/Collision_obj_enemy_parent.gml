/// @description Insert description here
// You can write your code in this editor

//check if enemy has been hit already
for (var i = 0; i < array_length(hit_enemies); i++) {
	if (hit_enemies[i] == other) return;
}

//deal damage to enemy
other.take_damage(damage);

//add enemy to hit_enemies array
array_push(hit_enemies, other);

//if out of pierces, destroy bullet
if(pierces <= 0) instance_destroy(self);

//reduce number of pierces if not destroyed
pierces--;