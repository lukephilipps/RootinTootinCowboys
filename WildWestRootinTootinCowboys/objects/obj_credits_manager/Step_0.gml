/// @description Insert description here
// You can write your code in this editor

if (!draw_thanks && move_text) text_pos += 1;

image_alpha -= .05;

step_count = (step_count + 1) % 60;

if (step_count % 40 == 1) 
{
	var y_roll = irandom_range(20, 300);
	var cac = instance_create_layer(x, y + y_roll, "Instances", obj_cac_credits);
	cac.image_xscale = y_roll / 500;
	cac.image_yscale = y_roll / 500;
	cac.hspeed -= y_roll / 20;
}
if (step_count % 30 == 2) instance_create_layer(x, y + irandom_range(-120, -110), "Instances", obj_rock_credits);