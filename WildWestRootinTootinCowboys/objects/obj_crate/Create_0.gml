/// @description Insert description here
// You can write your code in this editor

upixelH = shader_get_uniform(shdr_outline, "pixelH");
upixelW = shader_get_uniform(shdr_outline, "pixelW");
texelW = texture_get_texel_width(sprite_get_texture(sprite_index, 0));
texelH = texture_get_texel_height(sprite_get_texture(sprite_index, 0));

image_yscale = y_scale;
image_xscale = x_scale;

original_x = x;
original_y = y;

money_amount += irandom_range(0, 2);

//x_push and y_push amounts allow knockback to be added
function take_damage(damage)
{
	audio_stop_sound(sfx_cactus_take_damage);
	
	//make enemy try to chase player again if it gets out of range
	alarm[0] = room_speed / 10;
	
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
	
	audio_play_sound(sfx_cactus_take_damage, 50, false, 1, .3, random_range(.9, 1.1));
}

function kill()
{
	audio_play_sound(sfx_crate_break, 10, false, .8, 0, random_range(.9, 1.2));
	
	spawn_money();
	handle_ammo_spawn();
	
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
	var roll = irandom(99);
	roll += hitpoints / 10;
	
	if (roll > 97)
	{
		instance_create_layer(x, y, "Instances", obj_ammo_large);
	}
}