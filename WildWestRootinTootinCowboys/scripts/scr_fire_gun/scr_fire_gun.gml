// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_fire_gun()
{
	if (on_cooldown) return;
	
	if (reloading && magazine_size_current > 0) reloading = false;
	if (reloading && magazine_size_current == 0) return;
	
	on_cooldown = true;
	if (room_speed / fire_rate < 1) alarm[0] = 1;
	else alarm[0] = room_speed / fire_rate;

	if (magazine_size_current == 0) return;

	magazine_size_current--;

	var x_spawn_position = x + (sprite_width * cos(degtorad(image_angle)));
	var y_spawn_position = y - (sprite_width * sin(degtorad(image_angle)));
	
	recoil_angle = recoil_angle_amount;
	
	for (var i = 0; i < ceil(multishot_amount); i++)
		instance_create_layer(x_spawn_position, y_spawn_position, "Instances", bullet);
}