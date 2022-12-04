/// @description Insert description here
// You can write your code in this editor

if (obj_gamemanager.game_state != 0 || !active) return;

var player_x = obj_player.x;
var player_y = obj_player.y;

var distance_to_player = point_distance(x, y, player_x, player_y);

//"look" at the player
if (x < player_x) 
{
	image_xscale = x_scale;
	facing_left = false;
}
else 
{
	image_xscale = -x_scale;
	facing_left = true;
}

var move_speed = .22 * speed_modifier; //.22 is arbitrary base rush speed
move_direction = point_direction(x, y, player_x, player_y);
		
if (distance_to_player < 250)
{
	var total_speed = sqrt(abs(y_movement)^2 + abs(x_movement)^2);
			
	if (total_speed < 2)
		alarm[0] = room_speed / 2;
	else
		alarm[0] = room_speed / total_speed;
	close_to_player = true;
}
		
// If enemy is far from player, move directly towards player
if (!close_to_player)
{
	x_movement = 5 * speed_modifier * cos(degtorad(move_direction));
	y_movement = 5 * speed_modifier * -sin(degtorad(move_direction));
}
// If enemy is close to player, ease towards them allowing player to dodge
else
{
	x_movement += move_speed * cos(degtorad(move_direction));
	y_movement -= move_speed * sin(degtorad(move_direction));
}

if (can_spam_attack)
{
	audio_play_sound(sfx_cactus_charge, 20, false);
			
	can_spam_attack = false;
	alarm[2] = room_speed * 1.75;
	alarm[3] = room_speed * 1;
}
if (can_use_big_attack)
{
	var attack = random(2.5);
	
	//rush attack
	if (attack < 1)
	{
		freeze_movement = true;
		do_rush_animation = true;
		audio_play_sound(sfx_rev, 10, false, .7, 0, random_range(.9, 1.1));
		alarm[5] = 60;
	}
	else if (attack < 2)
	{
		attacks_used = 0;
		speed_modifier = .3;
		alarm[7] = 100;
	}
	else 
	{
		if (instance_number(obj_enemy_cactus) > 0)
		{
			attacks_used = 0;
			speed_modifier = .3;
			alarm[7] = 120;
		}
		else
		{
			audio_play_sound(sfx_cactus_charge, 20, false, 1, 0, .8);
			audio_play_sound(sfx_powerup, 20, false, .7, 0, 1);
			freeze_movement = true;
			alarm[8] = 90;
			alarm[6] = 180;
		}
	}
	big_attacking = true;
	can_use_big_attack = false;
}

if (freeze_movement)
{
	x_movement = 0;
	y_movement = 0;
	image_index = 1;
}
else if (rushing)
{
	instance_create_layer(x, y, "Instances", obj_afterimage_boss);
}

//move enemy
var predictedX = x + x_movement;
var predictedY = y + y_movement;
if (!place_meeting(predictedX, y, obj_wall)) {
	x += x_movement;
}
else {
	predictedX = x;
	while (!place_meeting(predictedX, y, obj_wall)) {
		predictedX += sign(x_movement);
	}
	x = predictedX - sign(x_movement);
}
if (!place_meeting(x, predictedY, obj_wall)) {
	y += y_movement;
}
else {
	predictedY = y;
	while (!place_meeting(x, predictedY, obj_wall)) {
		predictedY += sign(y_movement);
	}
	y = predictedY - sign(y_movement);
}