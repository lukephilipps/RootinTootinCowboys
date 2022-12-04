/// @description Insert description here
// You can write your code in this editor

if (obj_gamemanager.game_state != -1)
	audio_sound_gain(m_theme, (other.y - bbox_top) / (bbox_bottom - bbox_top) * .7, 100);