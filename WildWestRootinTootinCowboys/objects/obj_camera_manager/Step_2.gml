/// @description Insert description here
// You can write your code in this editor

//essentially get the mean between mouse pos and player pos, twice
//this places the camera focus 1/4th of the way from the player to the mouse
x = (mouse_x + 3 * obj_player.x) / 4;
y = (mouse_y + 3 * obj_player.y) / 4;