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
/*
function handle_input()
{
	walking = false;
	
	//move left
	if (keyboard_check(ord("A")) || keyboard_check(vk_left)) {
		hmovement += -movement_speed;
		walking = true;
	}
	//move right
	else if (keyboard_check(ord("D")) || keyboard_check(vk_right)) {
		hmovement += movement_speed;
		walking = true;
	}
	//move up
	if (keyboard_check(ord("W")) || keyboard_check(vk_up)) {
		vmovement += -movement_speed;
		walking = true;
	}
	//move down
	else if (keyboard_check(ord("S")) || keyboard_check(vk_down)) {
		vmovement += movement_speed;
		walking = true;
	}
	
	//if player is moving in two directions at once, make diagonal speed 
	//equal to movement_speed
	if (abs(hmovement) > 0 && abs(vmovement) > 0) {
		hmovement /= 1.41;
		vmovement /= 1.41;
	}
	
	//cycle weapon left button
	if (mouse_wheel_down() || keyboard_check_pressed(ord("Z"))) {
		cycle_weapon_left();
	}
	//cycle weapon right button
	if (mouse_wheel_up() || keyboard_check_pressed(ord("C"))) {
		cycle_weapon_right();
	}
	
	//reload current gun
	if (keyboard_check_pressed(ord("R"))) {
		weapons[selected_weapon].reload_gun();
	}
}
*/
function cycle_weapon_left()
{
	deactivate_weapons();
	selected_weapon--;
	if (selected_weapon < 0) selected_weapon = array_length(weapons) - 1;
	weapons[selected_weapon].activate();
}

function cycle_weapon_right()
{
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
		
		if (health <= 0)
		{
			deactivate_weapons();
			obj_gamemanager.game_state = -1;
			instance_destroy(self);
		}
		
		i_frames = room_speed;
		obj_camera_manager.add_shake(15);
		audio_play_sound(sfx_player_damaged, 30, false);
	}
}

//for testing purposes
function printAllWeaponNames()
{
	for (var i = 0; i < array_length(weapons); i++) show_debug_message(weapons[i].gun_name);
}