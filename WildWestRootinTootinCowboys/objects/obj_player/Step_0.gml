/// @description Insert description here
// You can write your code in this editor

if (obj_gamemanager.game_state != 0) return;

var up = (keyboard_check(ord("W")) || keyboard_check(vk_up));
var down = (keyboard_check(ord("S")) || keyboard_check(vk_down));
var left = (keyboard_check(ord("A")) || keyboard_check(vk_left));
var right = (keyboard_check(ord("D")) || keyboard_check(vk_right));
var dash = keyboard_check(vk_space);

xVel = (right - left) * movement_speed;
yVel = (down - up) * movement_speed;

//if player is moving in two directions at once, make diagonal speed 
//equal to movement_speed
if (abs(xVel) > 0 && abs(yVel) > 0) {
	xVel /= 1.41;
	yVel /= 1.41;
}

//handle cycle left
if (mouse_wheel_down() || keyboard_check_pressed(ord("Z"))) {
	cycle_weapon_left();
}
//handle cycle right
if (mouse_wheel_up() || keyboard_check_pressed(ord("C"))) {
	cycle_weapon_right();
}

//handle weapon reload
if (keyboard_check_pressed(ord("R")))
{
	weapons[selected_weapon].reload_gun();
}

var look_angle = point_direction(x, y, mouse_x, mouse_y);

//if player is idle, set idle animation
if (down - up == 0 && right - left == 0 && !is_dashing)
{
	image_speed = 0;
	image_index = 0; //arbitrary good looking frame, switch later
}
else
{
	image_speed = animation_speed;
}

//set player look animation based on mouse pos
if (look_angle > 15 && look_angle < 165)
{
	sprite_index = spr_player_walkback;
}
else
{
	sprite_index = spr_player_walk2;
}

//flip player on x-axis based on mouse pos
if (look_angle > 90 && look_angle < 270) facing_left = true;
else facing_left = false;

if (facing_left) image_xscale = -x_scale;
else image_xscale = x_scale;

//handle iframes
if (i_frames > 0)
{
	invincible = true;
	i_frames--;
}
else
{
	invincible = false;
}

//handle dash press
if (dash && can_dash)
{
	can_dash = false;
	is_dashing = true;
	alarm[0] = room_speed * dash_recharge_time;
	alarm[1] = room_speed * dash_time;
	
	//this is trash rewrite this later why didnt i just store sign(xVel) and stuff
	dash_direction = 0;
	if (sign(xVel) == 1 && sign(yVel) == 1) dash_direction = 1;
	if (sign(xVel) == 0 && sign(yVel) == 1) dash_direction = 2;
	if (sign(xVel) == -1 && sign(yVel) == 1) dash_direction = 3;
	if (sign(xVel) == -1 && sign(yVel) == 0) dash_direction = 4;
	if (sign(xVel) == -1 && sign(yVel) == -1) dash_direction = 5;
	if (sign(xVel) == 0 && sign(yVel) == -1) dash_direction = 6;
	if (sign(xVel) == 1 && sign(yVel) == -1) dash_direction = 7;
	
	for (var i = 0; i < array_length(passive_items); i++) {
		passive_items[i].dash_effect();
	}
	
	audio_play_sound(sfx_player_dash, 5, false);
}

//If player is currently in a dash
if (is_dashing)
{
	image_speed = 5;
	
	switch (dash_direction) 
	{
		case 0:
			xVel += dash_distance / (dash_time * room_speed);
			yVel += 0;
		break;
		case 1:
			xVel += (dash_distance / (dash_time * room_speed)) / 1.41;
			yVel += (dash_distance / (dash_time * room_speed)) / 1.41;
		break;
		case 2:
			xVel += 0;
			yVel += dash_distance / (dash_time * room_speed);
		break;
		case 3:
			xVel += -(dash_distance / (dash_time * room_speed)) / 1.41;
			yVel += (dash_distance / (dash_time * room_speed)) / 1.41;
		break;
		case 4:
			xVel += -dash_distance / (dash_time * room_speed);
			yVel += 0;
		break;
		case 5:
			xVel += -(dash_distance / (dash_time * room_speed)) / 1.41;
			yVel += -(dash_distance / (dash_time * room_speed)) / 1.41;
		break;
		case 6:
			xVel += 0;
			yVel += -dash_distance / (dash_time * room_speed);
		break;
		case 7:
			xVel += (dash_distance / (dash_time * room_speed)) / 1.41;
			yVel += -(dash_distance / (dash_time * room_speed)) / 1.41;
		break;
	}
	
	//create cool effects
	instance_create_layer(x, y, "Instances", obj_afterimage);
}

//determine movement with collision checking
var predictedX = x + xVel;
var predictedY = y + yVel;
if (!place_meeting(predictedX, y, obj_wall) && !place_meeting(predictedX, y, obj_crate)) {
	x += xVel;
}
else {
	predictedX = x;
	while (!place_meeting(predictedX, y, obj_wall) && !place_meeting(predictedX, y, obj_crate)) {
		predictedX += sign(xVel);
	}
	x = predictedX - sign(xVel);
}
if (!place_meeting(x, predictedY, obj_wall) && !place_meeting(x, predictedY, obj_crate)) {
	y += yVel;
}
else {
	predictedY = y;
	while (!place_meeting(x, predictedY, obj_wall) && !place_meeting(x, predictedY, obj_crate)) {
		predictedY += sign(yVel);
	}
	y = predictedY - sign(yVel);
}

/*
if (abs(xVel) > 0 || abs(yVel) > 0)
{
	step_count++;
	if (step_count > 30 - movement_speed - (15 * is_dashing)) 
	{
		audio_play_sound(sfx_player_footstep, 1, false);
		step_count = 0;
	}
}
else audio_stop_sound(sfx_player_footstep);
*/