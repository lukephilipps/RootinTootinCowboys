/// @description Insert description here
// You can write your code in this editor

step_count = (step_count + 1) % 5;
if (step_count == 0) effect_create_above(ef_smokeup, x, y, 0, c_gray);