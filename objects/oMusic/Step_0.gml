/// @description Insert description here
// You can write your code in this editor
if (audio_sound_get_gain(bgmIntro) <= 0)
{
	audio_stop_sound(bgmIntro);
}
if (audio_sound_get_gain(Bgm) <= 0)
{
	audio_stop_sound(Bgm);
}
if (audio_sound_get_gain(bgmRoom2) <= 0)
{
	audio_stop_sound(bgmRoom2);
}
if (audio_sound_get_gain(bgmRoom3) <= 0)
{
	audio_stop_sound(bgmRoom3);
}