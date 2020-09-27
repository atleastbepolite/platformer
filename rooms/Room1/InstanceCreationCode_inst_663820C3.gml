if (global.diamonds == 3)
{
	SlideTransition(TRANS_MODE.GOTO, Room2B);
	global.diamonds = 0;
	audio_sound_gain(Bgm,0,2000);
	audio_play_sound(bgmRoom2,1000,true);
	audio_sound_gain(bgmRoom2,0,0);
	audio_sound_gain(bgmRoom2,1,2000);
}
else
{
	target = Room1;
}

