/// @description Insert description here
// You can write your code in this editor

step_count = (step_count + 10) % 1400;

y = original_y + 5 * cos(degtorad(min(step_count, 360)));