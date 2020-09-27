if (global.hasgun == true)
{
	SlideTransition(TRANS_MODE.GOTO, Room2A);
	audio_sound_gain(bgmRoom2,0,2000);
	audio_play_sound(bgmRoom3,1000,true);
	audio_sound_gain(bgmRoom3,0,0);
	audio_sound_gain(bgmRoom3,1,2000);
}
else
{
	target = Room2B;
}