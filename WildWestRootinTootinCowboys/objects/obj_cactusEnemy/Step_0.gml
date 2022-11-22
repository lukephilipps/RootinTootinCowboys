/// @description Insert description here
// You can write your code in this editor

// enemy types
// 0 - stationary
// 1 - rushdown
// 2 - shooter
// 3 - 
 
if (obj_gamemanager.game_state != 0) return;

var player_x = obj_player.x;
var player_y = obj_player.y;

var distance_to_player = point_distance(x, y, player_x, player_y);
if (!active && distance_to_player < 850) active = true;
if (!active) return;

if (active && distance_to_player > 950)
{
	active = false;
	return;
}

//"look" at the player
if (x < player_x) image_xscale = x_scale;
else image_xscale = -x_scale;

var move_speed = .22 * speed_modifier; //.22 is arbitrary base rush speed
move_direction = point_direction(x, y, player_x, player_y);
		
// If enemy close to player, set a flag that it is close
// The flag will change a few seconds after leaving "close to player"
// range so it doesn't jitter to run towards player quickly
if (distance_to_player < 250)
{
	var total_speed = sqrt(abs(y_movement)^2 + abs(x_movement)^2);
			
	if (total_speed < 2)
		alarm[0] = room_speed / 2;
	else
		alarm[0] = room_speed / total_speed;
	close_to_player = true;
}
		
//attack player if can
if (distance_to_player < 400 && can_attack)
{
	audio_play_sound(sfx_cactus_charge, 20, false);
			
	image_index = 1;
	attacking = true;
	can_attack = false;
	alarm[2] = room_speed * irandom_range(6, 10);
	alarm[3] = room_speed * 2; //allow enemy to move again
	alarm[4] = room_speed * 1; //shoot circular bullets
}
		
if (attacking) 
{
	x_movement = 0;
	y_movement = 0;
}
else
{
		
	// If enemy is far from player, move directly towards player
	if (!close_to_player)
	{
		//5 is an arbitrary num obtained by testing
		var chase_speed = 5;
			
		x_movement = chase_speed * speed_modifier * cos(degtorad(move_direction));
		y_movement = chase_speed * speed_modifier * -sin(degtorad(move_direction));
	}
	// If enemy is close to player, ease towards them allowing player to dodge
	else
	{
		x_movement += move_speed * cos(degtorad(move_direction));
		y_movement -= move_speed * sin(degtorad(move_direction));
	}
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