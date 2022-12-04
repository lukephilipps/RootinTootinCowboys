/// @description Insert description here
// You can write your code in this editor

upixelH = shader_get_uniform(shdr_outline, "pixelH");
upixelW = shader_get_uniform(shdr_outline, "pixelW");
texelW = texture_get_texel_width(sprite_get_texture(sprite_index, 0));
texelH = texture_get_texel_height(sprite_get_texture(sprite_index, 0));

image_yscale = y_scale;
image_xscale = x_scale;
image_index = 1;

hitpoints += 80 * array_length(obj_player.weapons) + 40 * array_length(obj_player.passive_items);
spawn_health = hitpoints;

//x_push and y_push amounts allow knockback to be added
function take_damage(bullet, damage)
{
	audio_stop_sound(sfx_cactus_take_damage);
	
	//damage enemy, kill them if no health
	hitpoints -= damage;
	if (hitpoints <= 0) kill();
	
	//set damaged flag for shader animation
	took_damage = true;
	alarm[1] = 5;
	
	audio_play_sound(sfx_cactus_take_damage, 50, false, 1, .3, .7);
}

function kill()
{
	alarm[9] = 120;
	obj_player.image_speed = 0;
	obj_player.image_index = 0;
	audio_sound_gain(m_boss, 0, 2000);
	with (obj_enemy_cactus) kill();;
	attacks_used = 0;
	obj_camera_manager.boss_dead = true;
	active = false;
	obj_gamemanager.game_state = 1;
	obj_camera_manager.focusing_boss = true;
}