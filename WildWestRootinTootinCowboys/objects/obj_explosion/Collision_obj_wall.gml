/// @description Insert description here
// You can write your code in this editor

// If bullet has a remaining bounce, bounce bullet
// and add new direction to it. Allow bullet to rehit
// enemies already hit if piercing.
if (ceil(bounces) > 0) {
	move_bounce_all(false);
	image_angle = direction;
	bounces--;
}
else {
	instance_destroy(self);
}