/// @description Insert description here
// You can write your code in this editor

// If bullet has a remaining bounce, bounce bullet
// and add new direction to it. Allow bullet to rehit
// enemies already hit if piercing.
if (ceil(bounces) > 0) {
	audio_stop_sound(sfx_ricochet_1);
	audio_play_sound(sfx_ricochet_1, 10, false, .11, .6, random_range(.7, 1.3));
	move_bounce_all(false);
	image_angle = direction;
	bounces--;
	hit_enemies = [];
}
else {
	instance_destroy(self);
}