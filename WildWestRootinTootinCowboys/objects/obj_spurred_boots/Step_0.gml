/// @description Insert description here
// You can write your code in this editor

if (spawning_spikes)
{
	spike_spawn = (spike_spawn + 1) % (2.8 - obj_player.fire_rate_multiplier);
	if (spike_spawn < 1) 
	{
		instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_spike_bullet);
	}
}