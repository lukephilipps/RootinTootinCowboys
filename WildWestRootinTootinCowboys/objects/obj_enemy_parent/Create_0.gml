/// @description Insert description here
// You can write your code in this editor

upixelH = shader_get_uniform(shdr_outline, "pixelH");
upixelW = shader_get_uniform(shdr_outline, "pixelW");
texelW = texture_get_texel_width(sprite_get_texture(sprite_index, 0));
texelH = texture_get_texel_height(sprite_get_texture(sprite_index, 0));

//x_push and y_push amounts allow knockback to be added
function take_damage(damage)
{
	//damage enemy, kill them if no health
	self.health -= damage;
	if (self.health <= 0) kill();
	
	//set damaged flag for shader animation
	took_damage = true;
	alarm[1] = 5;
}

function kill()
{
	instance_destroy(self);
}