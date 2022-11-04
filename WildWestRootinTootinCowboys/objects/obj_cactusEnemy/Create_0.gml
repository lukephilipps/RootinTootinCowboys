/// @description Insert description here
// You can write your code in this editor

upixelH = shader_get_uniform(shdr_outline, "pixelH");
upixelW = shader_get_uniform(shdr_outline, "pixelW");
texelW = texture_get_texel_width(sprite_get_texture(sprite_index, 0));
texelH = texture_get_texel_height(sprite_get_texture(sprite_index, 0));

//x_push and y_push amounts allow knockback to be added
function take_damage(damage)
{
	var knockback = 2; //arbitrary num acquired by testing
	
	//make enemy try to chase player again if it gets out of range
	alarm[0] = room_speed / 10;
	
	//knock enemy away from player, scaling with damage taken
	if (can_take_knockback) {
		x_movement += (1 - knockback_resist) * (damage * knockback * -cos(degtorad(move_direction)));
		y_movement += (1 - knockback_resist) * (damage * knockback * sin(degtorad(move_direction)));
	}
	
	//damage enemy, kill them if no health
	hitpoints -= damage;
	if (hitpoints <= 0) kill();
	
	//set damaged flag for shader animation
	took_damage = true;
	alarm[1] = 5;
	
	audio_stop_sound(sfx_cactus_take_damage);
	audio_play_sound(sfx_cactus_take_damage, 50, false, 1, .3);
}

function kill()
{
	audio_play_sound(death_sfx, 10, false, 1, 0, random_range(.9, 1.2));
	
	effect_create_above(ef_smoke, x, y - 100, 2, c_white);
	effect_create_above(ef_smoke, x, y - 140, 2, c_white);
	effect_create_above(ef_smoke, x, y - 180, 2, c_white);
	effect_create_above(ef_smoke, x, y - 220, 2, c_white);
	
	var body = instance_create_layer(x, y, "Instances", obj_enemy_body);
	body.sprite_index = spr_DeadCactus;
	body.image_xscale = image_xscale;	
	body.image_yscale = image_yscale;
	instance_destroy(self);
}