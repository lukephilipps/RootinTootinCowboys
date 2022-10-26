/// @description Insert description here
// You can write your code in this editor

if (!activated) return;
else if (reloading) image_speed = 0;
else if (on_cooldown) image_speed = 4;
else image_speed = 1;

event_inherited();