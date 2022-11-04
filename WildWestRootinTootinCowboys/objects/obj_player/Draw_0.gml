/// @description Insert description here
// You can write your code in this editor

//if enemy recently took damage, shade them white
if (i_frames & 1) {
	shader_set(shdr_invincible);
	shader_set_uniform_f(upixelW, texelW);
	shader_set_uniform_f(upixelH, texelH);
	draw_self();
	shader_reset();
}
else {
	draw_self();
}