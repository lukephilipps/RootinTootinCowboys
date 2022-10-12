/// @description Insert description here
// You can write your code in this editor

//if enemy recently took damage, shade them white
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