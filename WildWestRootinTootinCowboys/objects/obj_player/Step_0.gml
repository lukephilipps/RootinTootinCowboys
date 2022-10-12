/// @description Insert description here
// You can write your code in this editor

var up = (keyboard_check(ord("W")) || keyboard_check(vk_up));
var down = (keyboard_check(ord("S")) || keyboard_check(vk_down));
var left = (keyboard_check(ord("A")) || keyboard_check(vk_left));
var right = (keyboard_check(ord("D")) || keyboard_check(vk_right));

xVel = (right - left) * movement_speed;
yVel = (down - up) * movement_speed;

//if player is moving in two directions at once, make diagonal speed 
//equal to movement_speed
if (abs(xVel) > 0 && abs(yVel) > 0) {
	xVel /= 1.41;
	yVel /= 1.41;
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

var look_angle = point_direction(x, y, mouse_x, mouse_y);

if (down - up == 0 && right - left == 0)
{
	image_speed = 0;
	image_index = 9; //arbitrary good looking frame, switch later
}
else
{
	image_speed = animation_speed;
}

if (look_angle < 180)
{
	sprite_index = spr_player_walk_rb;
}
else
{
	sprite_index = spr_player_walk_r;
}

if (look_angle > 90 && look_angle < 270) facing_left = true;
else facing_left = false;

if (facing_left) image_xscale = -x_scale;
else image_xscale = x_scale;

//determine movement with collision checking
var predictedX = x + xVel;
var predictedY = y + yVel;
if (!place_meeting(predictedX, y, obj_wall)) {
	x += xVel;
}
else {
	predictedX = x;
	while (!place_meeting(predictedX, y, obj_wall)) {
		predictedX += sign(xVel);
	}
	x = predictedX - sign(xVel);
}
if (!place_meeting(x, predictedY, obj_wall)) {
	y += yVel;
}
else {
	predictedY = y;
	while (!place_meeting(x, predictedY, obj_wall)) {
		predictedY += sign(yVel);
	}
	y = predictedY - sign(yVel);
}