//Move player towards center
layer_x("Player", min(layer_get_x("Player")+1,RES_W * 0.5 - 32));

// Progress Text
letters += spd;
text = string_copy(endtext[currentline],1,floor(letters));

//Next line
if (letters >= length) && (keyboard_check_pressed(vk_anykey))
{
	if (currentline+1 == array_length_1d(endtext))
	{
		SlideTransition(TRANS_MODE.RESTART);
		audio_sound_gain(bgmRoom3,0,2000);
		audio_play_sound(bgmIntro,1000,true);
		audio_sound_gain(bgmIntro,0,0);
		audio_sound_gain(bgmIntro,1,2000);
	}
	else
	{
		currentline++;
		letters = 0;
		length = string_length(endtext[currentline]);
	}
}