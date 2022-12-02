/// @description Insert description here
// You can write your code in this editor

if (obj_gamemanager.game_state != 0) return;

var player_x = obj_player.x;
var player_y = obj_player.y;

var distance_to_player = point_distance(x, y, player_x, player_y);
if (!active && distance_to_player < 700) 
{
	with (obj_enemy_rat) 
	{
		active = true;
		alarm[2] = 30;
		alarm[3] = 600;
		current_ammo = mag_size;
	}
	alarm[2] = 1;
	alarm[3] = 600;
}
if (!active) 
{	
	x = spawn_x;
	y = spawn_y;
	return;
}

if (active && distance_to_player > 1200)
{
	active = false;
	return;
}

//"look" at the player
if (x < player_x) 
{
	image_xscale = x_scale;
	looking_left = true;
}
else 
{
	image_xscale = -x_scale;
	looking_left = false;
}

move_direction = point_direction(x, y, player_x, player_y);

if (move_direction > 165 || move_direction < 15)
{
	gun_back = false;
	sprite_index = spr_rat;
}
else 
{
	gun_back = true;
	sprite_index = spr_rat2;
}

// If enemy close to player, set a flag that it is close
// The flag will change a few seconds after leaving "close to player"
// range so it doesn't jitter to run towards player quickly
if (distance_to_player < 400)
{
	alarm[0] = 1;
	close_to_player = true;
}
		
// If enemy is far from player, move directly towards player
if (!close_to_player)
{
	//5 is an arbitrary num obtained by testing
	var chase_speed = 5;
			
	x_movement = chase_speed * speed_modifier * cos(degtorad(move_direction));
	y_movement = chase_speed * speed_modifier * -sin(degtorad(move_direction));
	x_movement += irandom_range(-1, 1);
	y_movement += irandom_range(-1, 1);
}
else if (distance_to_player > 350)
{
	x_movement = 0;
	y_movement = 0;
}
else
{
	x_movement = - (5 * speed_modifier * cos(degtorad(move_direction)));
	y_movement = - (5 * speed_modifier * -sin(degtorad(move_direction)));
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

if (recoil_angle > 0) recoil_angle--;