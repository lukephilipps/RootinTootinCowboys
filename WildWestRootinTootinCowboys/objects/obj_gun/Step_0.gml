/// @description Insert description here
// You can write your code in this editor

if (!activated) return;

if (reloading) {
	reload_step_count++;
	percent_reloaded = reload_step_count / (room_speed * reload_speed);
	
	rel_anim_x1 = (x - camera_get_view_x(view_camera[0])) + (sprite_width / 2) * cos(degtorad(image_angle)) - 20;
	rel_anim_x2 = (x - camera_get_view_x(view_camera[0])) + (sprite_width / 2) * cos(degtorad(image_angle)) + 20;
	
	if (!facing_left) {
		rel_anim_y1 = (y - camera_get_view_y(view_camera[0])) - (sprite_height / 2) - sprite_width * sin(degtorad(image_angle)) - 12;
		rel_anim_y2 = (y - camera_get_view_y(view_camera[0])) - (sprite_height / 2) - sprite_width * sin(degtorad(image_angle)) - 3;
	}
	else {
		rel_anim_y1 = (y - camera_get_view_y(view_camera[0])) + ((sprite_height / 2) - sprite_width * sin(degtorad(image_angle)) - 12);	
		rel_anim_y2 = (y - camera_get_view_y(view_camera[0])) + ((sprite_height / 2) - sprite_width * sin(degtorad(image_angle)) - 3);
	}	
}

image_angle = point_direction(x, y, mouse_x, mouse_y);

if (recoil_angle > 0) recoil_angle--;

if (image_angle > 90 && image_angle < 270) facing_left = true;
else facing_left = false;

if (facing_left) image_yscale = -y_scale;
else image_yscale = y_scale;

if (facing_left) image_angle -= recoil_angle;
else image_angle += recoil_angle;