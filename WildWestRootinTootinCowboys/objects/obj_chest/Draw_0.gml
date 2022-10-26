/// @description Insert description here
// You can write your code in this editor
if (colliding_with_player && !opened) {
	shader_set(shdr_outline);
	shader_set_uniform_f(upixelW, texelW);
	shader_set_uniform_f(upixelH, texelH);
	draw_self();
	shader_reset();
}
else {
	draw_self();
}