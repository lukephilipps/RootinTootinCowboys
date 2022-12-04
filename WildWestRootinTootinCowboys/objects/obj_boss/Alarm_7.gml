/// @description Insert description here
// You can write your code in this editor

if (obj_gamemanager.game_state != 0) return;

audio_play_sound(sfx_crumble, 10, false);

for (var i = 0; i < 60; i++)
{
	instance_create_layer(obj_player.x + irandom_range(-900, 900), obj_player.y + irandom_range(-800, 800), "Instances", obj_saguaro_surprise);
}

attacks_used++;
if (attacks_used < irandom_range(2, 3)) alarm[7] = 140;
else alarm[6] = 60;