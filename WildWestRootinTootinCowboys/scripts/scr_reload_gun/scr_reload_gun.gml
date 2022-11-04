// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_reload_gun()
{
	if (!activated || reloading || magazine_size_current == magazine_size || current_ammo == 0) return;

	audio_stop_sound(reload_start_sfx);
	audio_play_sound(reload_start_sfx, 10, false);

	reloading = true;
	reload_step_count = 0;
	percent_reloaded = 0;
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

	if (room_speed * reload_speed < 1) alarm[1] = 1;
	else alarm[1] = room_speed * reload_speed;
}