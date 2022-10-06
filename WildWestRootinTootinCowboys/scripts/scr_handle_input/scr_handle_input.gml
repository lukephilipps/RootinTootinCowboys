// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_handle_input()
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
		scr_cycle_left();
	}
	//cycle weapon right button
	if (mouse_wheel_up() || keyboard_check_pressed(ord("C"))) {
		scr_cycle_right();
	}
	
	//reload current gun
	if (keyboard_check_pressed(ord("R"))) {
		weapons[selected_weapon].reload_gun();
	}
}