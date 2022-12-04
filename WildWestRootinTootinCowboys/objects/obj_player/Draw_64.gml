/// @description Insert description here
// You can write your code in this editor

if (debugging) {
	draw_set_halign(fa_left);
	draw_set_color(c_white);
	draw_set_font(fnt_debug);
	draw_text(10, 20, "Movement speed: " + string(movement_speed));
	draw_text(10, 45, "Inaccuracy: " + string(inaccuracy));
	draw_text(10, 70, "Damage multiplier: " + string(damage_multiplier));
	draw_text(10, 95, "Bullet Speed: " + string(bullet_speed_multiplier));
	draw_text(10, 120, "Reload Speed: " + string(reload_speed_multiplier));
	draw_text(10, 145, "Magazine Size multiplier: " + string(magazine_size_multiplier));
	draw_text(10, 170, "Ammo multiplier: " + string(max_ammo_multiplier));
	draw_text(10, 195, "Bullet Size multiplier: " + string(bullet_size_multiplier));
	draw_text(10, 220, "Multishot: " + string(multishot_multiplier));
	draw_text(10, 245, "Fire rate multiplier: " + string(fire_rate_multiplier));
}

if (obj_gamemanager.game_state == 0)
{
	draw_set_alpha(1);
	var xdraw = 10;
	for(var i = 0; i < array_length(passive_items); i++) {
		draw_sprite(passive_items[i].sprite_index, -1 , xdraw + passive_items[i].sprite_width / 2, camera_get_view_height(view_camera[0]) - 30);
		xdraw += 10 + passive_items[i].sprite_width;
	}
}