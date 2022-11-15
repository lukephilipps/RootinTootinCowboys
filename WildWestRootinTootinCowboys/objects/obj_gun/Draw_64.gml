/// @description Draw reload animation, current ammo
// You can write your code in this editor

if (!activated) return;

draw_set_halign(fa_right);
draw_set_color(c_white);
draw_set_font(fnt_ammo);
draw_set_alpha(1);
if (!infinite_ammo)
	draw_text(view_wport[0] - 40, view_hport[0] - 80, string(magazine_size_current) + " / " + string(current_ammo));
else
{
	draw_text(view_wport[0] - 80, view_hport[0] - 80, string(magazine_size_current) + " / ");
	draw_sprite(spr_infinity, 0, view_wport[0] - 60, view_hport[0] - 54);
}

//show reload animation above gun
if (reloading) {
	draw_set_color(c_gray);
	draw_rectangle(rel_anim_x1, rel_anim_y1, rel_anim_x2, rel_anim_y2, false);
		
	draw_set_color(c_white);
	draw_rectangle(rel_anim_x1, rel_anim_y1, rel_anim_x1 + (40 * percent_reloaded), rel_anim_y2, false);
}