/// @description Insert description here
// You can write your code in this editor

if (!active)
{
	draw_self();
}
else if (gun_back)
{
	if (took_damage) gpu_set_fog(true, c_white, 0, 1000);
	if (looking_left) draw_sprite_ext(spr_rat_shotgun, 0, x, y - 36, x_scale - .18, y_scale - .18, move_direction + recoil_angle, c_white, 1);
	else if (!looking_left) draw_sprite_ext(spr_rat_shotgun, 0, x, y - 36, x_scale - .18, -(y_scale - .18), move_direction - recoil_angle, c_white, 1);
	gpu_set_fog(false, c_white, 0, 1000);
	
	if (took_damage) {
		shader_set(shdr_damage);
		shader_set_uniform_f(upixelW, texelW);
		shader_set_uniform_f(upixelH, texelH);
		draw_self();
		shader_reset();
	}
	else {
		draw_self();
	}
}
else
{
	if (took_damage) {
		shader_set(shdr_damage);
		shader_set_uniform_f(upixelW, texelW);
		shader_set_uniform_f(upixelH, texelH);
		draw_self();
		shader_reset();
	}
	else {
		draw_self();
	}

	if (took_damage) gpu_set_fog(true, c_white, 0, 1000);
	if (looking_left) draw_sprite_ext(spr_rat_shotgun, 0, x, y - 36, x_scale - .18, y_scale - .18, move_direction + recoil_angle, c_white, 1);
	else if (!looking_left) draw_sprite_ext(spr_rat_shotgun, 0, x, y - 36, x_scale - .18, -(y_scale - .18), move_direction - recoil_angle, c_white, 1);
	gpu_set_fog(false, c_white, 0, 1000);
}