/// @description Insert description here
// You can write your code in this editor

alarm[0] = 30;
if (!activated)
{
	obj_gamemanager.in_shop = true;
	audio_sound_gain(m_theme, 0, 1000);
	if (!audio_is_playing(m_shop)) audio_play_sound(m_shop, 1, true, .7);
	audio_sound_gain(m_shop, 0, 0);
	audio_sound_gain(m_shop, .7, 1000);
	activated = true;
}