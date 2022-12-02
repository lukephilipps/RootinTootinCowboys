/// @description Insert description here
// You can write your code in this editor

if (draw_item)
{
	if (item_y_offset > 0) item_y_offset -= 8;
	item_alpha -= .02;
	if (item_alpha <= 0) draw_item = false;
}

coin_animation += .05;
if (got_money) coin_animation += .2;