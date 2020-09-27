x = oPlayer.x;
y = oPlayer.y - 30;

image_angle = point_direction(x,y,mouse_x,mouse_y);

firingdelay = firingdelay - 1; 
recoil = max(0,recoil - 1); 

if (mouse_check_button(mb_left)) && (firingdelay < 0) 
{
	recoil = 4;
	firingdelay = 5;
	ScreenShake(2,10);
	audio_sound_pitch(snPioong1,choose(1.2, 1.1));
	audio_play_sound(snPioong1,5,false);
	with (instance_create_layer(x,y,"Bullets",oBullet))
	{
		spd = 25;
		direction = other.image_angle + random_range(-3,3); 
		image_angle = direction;
	}		
	with (oPlayer)
	{
		gunkickx = lengthdir_x(1.5, other.image_angle-180);
		gunkicky = lengthdir_y(1, other.image_angle - 180);
	}
}

x = x - lengthdir_x(recoil,image_angle)
y = y - lengthdir_y(recoil,image_angle) 

if (image_angle > 90) && (image_angle < 270) // (image_angle = 0) = to the right 
{
	image_yscale = -1;
}
else
{
	image_yscale = 1;
}