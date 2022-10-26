/// @description Draw reload animation, current ammo
// You can write your code in this editor

if (!activated) return;

draw_set_halign(fa_right);
draw_set_color(c_white);
draw_set_font(fnt_ammo);
draw_text(window_get_width() - 40, window_get_height() - 80, string(magazine_size_current) + " / " + string(current_ammo));

//show reload animation above gun
if (reloading) {
	draw_set_color(c_gray);
	draw_rectangle(rel_anim_x1, rel_anim_y1, rel_anim_x2, rel_anim_y2, false);
		
	draw_set_color(c_white);
	draw_rectangle(rel_anim_x1, rel_anim_y1, rel_anim_x1 + (40 * percent_reloaded), rel_anim_y2, false);
}