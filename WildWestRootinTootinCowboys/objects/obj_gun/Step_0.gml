/// @description Insert description here
// You can write your code in this editor

if (!activated) return;

if (reloading) reload_step_count++;

image_angle = point_direction(x, y, mouse_x, mouse_y);

if (image_angle > 180) depth = -1;
else depth = 1;

if (recoil_angle > 0) recoil_angle--;

if (image_angle > 90 && image_angle < 270) facing_left = true;
else facing_left = false;

if (facing_left) image_yscale = -y_scale;
else image_yscale = y_scale;

if (facing_left) image_angle -= recoil_angle;
else image_angle += recoil_angle;