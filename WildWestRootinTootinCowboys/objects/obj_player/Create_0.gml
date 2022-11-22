/// @description Insert description here
// You can write your code in this editor

upixelH = shader_get_uniform(shdr_invincible, "pixelH");
upixelW = shader_get_uniform(shdr_invincible, "pixelW");
texelW = texture_get_texel_width(sprite_get_texture(sprite_index, 0));
texelH = texture_get_texel_height(sprite_get_texture(sprite_index, 0));

image_xscale = x_scale;
image_yscale = y_scale;

weapons = [instance_create_layer(x, y, "Instances", obj_gun)];
weapons[0].activate();

function cycle_weapon_left()
{
	if (array_length(weapons) == 1) return;
	deactivate_weapons();
	selected_weapon--;
	if (selected_weapon < 0) selected_weapon = array_length(weapons) - 1;
	weapons[selected_weapon].activate();
}

function cycle_weapon_right()
{
	if (array_length(weapons) == 1) return; 
	deactivate_weapons();
	selected_weapon++;
	if (selected_weapon > array_length(weapons) - 1) selected_weapon = 0;
	weapons[selected_weapon].activate();
}

function deactivate_weapons()
{
	for (var i = 0; i < array_length(weapons); i++) weapons[i].deactivate();
}

//for use when a passive item is acquired
function recalc_weapon_stats()
{
	for (var i = 0; i < array_length(weapons); i++) weapons[i].recalc_stats();
}

//for use when a passive item is acquired
function recalc_player_stats()
{
	//hard coded base stats
	movement_speed = 8;
	inaccuracy = 1;
	damage_multiplier = 1;
	bullet_speed_multiplier = 1;
	reload_speed_multiplier = 1;
	magazine_size_multiplier = 1;
	max_ammo_multiplier = 1;
	bullet_size_multiplier = 1;
	multishot_multiplier = 1;
	fire_rate_multiplier = 1;
	dash_distance_multiplier = 1;
	dash_recharge_multiplier = 1;
	extra_bounces = 0;
	extra_pierces = 0;
	
	//add additive items first
	for (var i = 0; i < array_length(passive_items); i++) {
		passive_items[i].add_additive_stats();
	}
	//add multiplicative items second
	for (var i = 0; i < array_length(passive_items); i++) {
		passive_items[i].add_multiplicative_stats();
	}
	
	dash_recharge_time *= dash_recharge_multiplier;
	dash_distance *= dash_distance_multiplier;
	dash_time *= dash_time_multiplier;
	
	animation_speed = movement_speed / 5;
	
	recalc_weapon_stats();
}

function add_passive_item(item)
{
	passive_items[passive_index] = item;
	passive_index++;
	
	recalc_player_stats();
}

function add_gun(gun)
{
	weapons[array_length(weapons)] = gun;
	deactivate_weapons();
	weapons[array_length(weapons) - 1].activate();
	selected_weapon = array_length(weapons) - 1;
}

function take_damage(damage) 
{
	if (!invincible)
	{
		health -= damage;
		invincible = true;
		
		if (health <= 0)
		{
			obj_gamemanager.game_over_sequence();
		}
		
		i_frames = room_speed * 1;
		obj_camera_manager.add_shake(15);
		audio_play_sound(sfx_player_damaged, 30, false);
	}
}

//for testing purposes
function printAllWeaponNames()
{
	for (var i = 0; i < array_length(weapons); i++) show_debug_message(weapons[i].gun_name);
}