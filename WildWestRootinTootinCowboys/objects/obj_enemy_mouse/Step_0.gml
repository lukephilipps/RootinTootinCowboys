/// @description Insert description here
// You can write your code in this editor

if (obj_gamemanager.game_state != 0) return;

var player_x = obj_player.x;
var player_y = obj_player.y;

distance_to_player = point_distance(x, y, player_x, player_y);
if (!active && distance_to_player < 300) 
{
	audio_play_sound(sfx_jump_out2, 1, false);
	audio_play_sound(sfx_jump_out, 1, false);
	active = true;
	alarm[2] = 1;
	alarm[3] = 600;
	current_ammo = 5;
	for (var i = 0; i < 10; i++)
		instance_create_layer(x, y, "Instances", obj_grass_fx);
}
if (!active) 
{	
	step_count = (step_count + 3) % 360;
	if (step_count > 90 && step_count < 270) image_xscale = -x_scale;
	else image_xscale = x_scale;
	x = spawn_x + 30 * sin(degtorad(step_count));
	y = spawn_y;
	return;
}
else
{
	if (y_scale < .38) y_scale += .01;
	image_yscale = y_scale;
}

if (active && distance_to_player > 1200)
{
	active = false;
	y_scale  = .2;
	image_yscale = y_scale;
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
	sprite_index = spr_mouse1;
}
else 
{
	gun_back = true;
	sprite_index = spr_mouse2;
}

// If enemy close to player, set a flag that it is close
// The flag will change a few seconds after leaving "close to player"
// range so it doesn't jitter to run towards player quickly
if (distance_to_player < 350)
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
else if (distance_to_player > 300)
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