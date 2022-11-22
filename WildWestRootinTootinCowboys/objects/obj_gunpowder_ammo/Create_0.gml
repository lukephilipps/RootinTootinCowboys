/// @description Insert description here
// You can write your code in this editor

event_inherited();

function bullet_rng_effects(bullet, gun_used)
{
	var roll = irandom(99);
	roll += 5 / gun_used.multishot_amount;
	roll += 5 / bullet.damage;
	roll += 5 / gun_used.fire_rate;
	
	if (roll > 98) instance_create_layer(bullet.x, bullet.y, "Instances", obj_explosion_small);
}