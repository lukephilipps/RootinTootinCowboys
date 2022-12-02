/// @description Insert description here
// You can write your code in this editor

if (obj_gamemanager.game_state != 0) return;

x = (mouse_x + 7 * obj_player.x) / 8;
y = (mouse_y + 7 * obj_player.y) / 8;

if (shake_amount > 0) {
	x += irandom_range(-shake_strength, shake_strength);
	y += irandom_range(-shake_strength, shake_strength);
	shake_amount--;
}