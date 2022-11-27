/// @description Insert description here
// You can write your code in this editor

y = -100; //spawn offscreen, will probably change this later

//base stats stored for passive item calculations
base_fire_rate = fire_rate;
base_reload_speed = reload_speed;
base_magazine_size = magazine_size;
base_max_ammo = max_ammo;
base_multishot_amount = multishot_amount;

//stats changed according to player current stats
fire_rate *= obj_player.fire_rate_multiplier;
reload_speed *= obj_player.reload_speed_multiplier;
magazine_size = floor(obj_player.magazine_size_multiplier * magazine_size);
magazine_size_current = magazine_size;
max_ammo = floor(obj_player.max_ammo_multiplier * max_ammo);
current_ammo = max_ammo;
multishot_amount *= obj_player.multishot_multiplier

image_xscale = x_scale;
image_yscale = y_scale;

//to seperate player input from gun
function detect_click()
{
	if (!activated) return;
	
	if (magazine_size_current == 0) scr_reload_gun();
	
	if (autofire) return;
	
	scr_fire_gun();
}

//to seperate player input from gun
function detect_mouse_held()
{
	if (!activated || !autofire) return;
	scr_fire_gun();
}

function reload_gun()
{
	scr_reload_gun();
}

function deactivate()
{
	activated = false;
	y = -100; //move offscren
}

function activate()
{
	reloading = false;
	recoil_angle = 0;
	reload_step_count = 0;
	activated  = true;
	image_angle = point_direction(obj_player.x, obj_player.y, mouse_x, mouse_y);
}


//function to be used when an item is picked up
function recalc_stats()
{
	scr_recalc_stats();
}