/// @description Gun reload alarm
// You can write your code in this editor

if (!activated) return;

if (reloading) {
	var amount_to_reload = min(current_ammo, magazine_size - magazine_size_current);
	magazine_size_current += amount_to_reload;
	current_ammo -= amount_to_reload;
	reloading = false;
}