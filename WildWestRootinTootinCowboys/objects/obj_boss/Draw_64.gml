/// @description Insert description here
// You can write your code in this editor

if (active)
{
	for (var i = 0; i < 930 * health_percentage * .01; i += 30)
	{
		if (health_percentage > 75) draw_sprite_ext(spr_cac, 0, 350 + i, 840, .07, .07, 0, c_white, 1);
		else if (health_percentage > 50) draw_sprite_ext(spr_cac, 0, 350 + i, 840, .07, .07, 0, c_yellow, 1);
		else if (health_percentage > 25) draw_sprite_ext(spr_cac, 0, 350 + i, 840, .07, .07, 0, c_orange, 1);
		else draw_sprite_ext(spr_cac, 0, 350 + i, 840, .07, .07, 0, c_red, 1);
	}
	draw_healthbar(300, 830, 1300, 850, health_percentage, c_black, c_red, c_green, 0, true, true);
	draw_sprite_ext(spr_random_terrain, 2, 290, 860, .2, .2, 0, c_white, 1);
	draw_sprite_ext(spr_random_terrain, 2, 1310, 860, -.2, .2, 0, c_white, 1);
}