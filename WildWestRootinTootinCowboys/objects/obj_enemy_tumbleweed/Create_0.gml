/// @description Insert description here
// You can write your code in this editor

image_yscale = y_scale;
image_xscale = x_scale;

money_amount += irandom_range(0, 1);

//x_push and y_push amounts allow knockback to be added
function take_damage(bullet, damage)
{
	audio_stop_sound(sfx_cactus_take_damage);
	
	close_to_player = true;
	
	//make enemy try to chase player again if it gets out of range
	alarm[0] = room_speed / 2;
	
	//knock enemy away from player, scaling with damage taken
	if (can_take_knockback) {
		x_movement += (1 - knockback_resist) * (damage * 2 * -cos(degtorad(move_direction)));
		y_movement += (1 - knockback_resist) * (damage * 2 * sin(degtorad(move_direction)));
	}
	
	//damage enemy, kill them if no health
	hitpoints -= damage;
	if (hitpoints <= 0) kill();
	
	//set damaged flag for shader animation
	took_damage = true;
	alarm[1] = 5;
	
	audio_play_sound(sfx_cactus_take_damage, 50, false, 1, .3);
}

function kill()
{
	audio_play_sound(death_sfx, 10, false, 1, 0, random_range(.9, 1.2));
	for (var i = 0; i < array_length(obj_player.passive_items); i++)
		obj_player.passive_items[i].enemy_death_effect(x, y);
	spawn_money();
	handle_ammo_spawn();
	handle_heart_spawn();
	instance_destroy(self);
}

function spawn_money()
{
	for (var i = 0; i < floor(money_amount / 20); i++)
	{
		instance_create_layer(x, y, "Instances", obj_coin_gold);
	}
	money_amount = money_amount % 20;
	for (var i = 0; i < floor(money_amount / 5); i++)
	{
		instance_create_layer(x, y, "Instances", obj_coin_silver);
	}
	money_amount = money_amount % 5;
	for (var i = 0; i < money_amount; i++)
	{
		instance_create_layer(x, y, "Instances", obj_coin_bronze);
	}
}

function handle_ammo_spawn()
{
	var roll = irandom(100);
	roll += hitpoints / 10;
	
	if (roll > 98)
	{
		instance_create_layer(x, y, "Instances", obj_ammo_large);
	}
}

function handle_heart_spawn()
{
	var roll = irandom(100);
	roll += hitpoints / 10;
	
	if (roll > 98)
	{
		instance_create_layer(x, y - 40, "Instances", obj_heart_pickup);
	}
}