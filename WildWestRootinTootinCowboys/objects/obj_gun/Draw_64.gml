/// @description Draw reload animation, current ammo
// You can write your code in this editor

if (!activated) return;

draw_set_halign(fa_right);
draw_set_color(c_white);
draw_set_font(fnt_ammo);
draw_text(window_get_width() - 30, window_get_height() - 50, string(magazine_size_current) + " / " + string(current_ammo));

var cam_x = (x / room_width) * window_get_width();
var cam_y = (y / room_width) * window_get_height();
draw_rectangle(cam_x - 20, cam_y + 40, cam_x + 20, cam_y + 20, false);

//show reload animation above gun
if (reloading) {
	var x1 = 20;
	var x2 = 20;
	var y1 = 12;
	var y2 = 3;
	
	var percent_reloaded = reload_step_count / (room_speed * reload_speed);
	
	if (!facing_left) {
		draw_set_color(c_gray);
		draw_rectangle(x + (sprite_width / 2) * cos(degtorad(image_angle)) - x1, y - (sprite_height / 2) - sprite_width * sin(degtorad(image_angle)) - y1, x + (sprite_width / 2) * cos(degtorad(image_angle)) + x2, y - (sprite_height / 2) - sprite_width * sin(degtorad(image_angle)) - y2, false);
		
		draw_set_color(c_white);
		draw_rectangle(x + (sprite_width / 2) * cos(degtorad(image_angle)) - x1, y - (sprite_height / 2) - sprite_width * sin(degtorad(image_angle)) - y1, x + (sprite_width / 2) * cos(degtorad(image_angle)) - x1 + (2 * x2 * percent_reloaded), y - (sprite_height / 2) - sprite_width * sin(degtorad(image_angle)) - y2, false);
	}
	else {
		draw_set_color(c_gray);
		draw_rectangle(x + (sprite_width / 2) * cos(degtorad(image_angle)) - x1, y + ((sprite_height / 2) - sprite_width * sin(degtorad(image_angle)) - y1), x + (sprite_width / 2) * cos(degtorad(image_angle)) + x2, y + ((sprite_height / 2) - sprite_width * sin(degtorad(image_angle)) - y2), false);
		
		draw_set_color(c_white);
		draw_rectangle(x + (sprite_width / 2) * cos(degtorad(image_angle)) - x1, y + ((sprite_height / 2) - sprite_width * sin(degtorad(image_angle)) - y1), x + (sprite_width / 2) * cos(degtorad(image_angle)) - x1 + (2 * x2 * percent_reloaded), y + ((sprite_height / 2) - sprite_width * sin(degtorad(image_angle)) - y2), false);
	}
}