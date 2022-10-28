/// @description Insert description here
// You can write your code in this editor

//essentially get the mean between mouse pos and player pos, twice
//this places the camera focus 1/4th of the way from the player to the mouse
x = (mouse_x + 7 * obj_player.x) / 8;
y = (mouse_y + 7 * obj_player.y) / 8;

if (shake_amount > 0) {
	x += irandom_range(-shake_strength, shake_strength);
	y += irandom_range(-shake_strength, shake_strength);
	shake_amount--;
}