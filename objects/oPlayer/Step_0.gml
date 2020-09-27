//Get Player Input
if (hascontrol)
{
key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space);
}
else
{
	key_left = 0;
	key_right = 0;
	key_jump = 0;
}
//Calculate Movement
var move = key_right - key_left;

hsp = (move * walksp) + gunkickx;
gunkickx = 0;

// vsp = vsp + grv; - this collides with wall jump vsp 

//Jumping 
canjump -= 1 
if (canjump > 0) && (key_jump) // if on the floor and jumped, same as, if (place_meeting(x,y+1,oWall)) && (key_jump)
{
	vsp = -7; 
	canjump = 0
}

//Horizontal Collision
if (place_meeting(x+hsp,y,oWall))
{
	while (!place_meeting(x+sign(hsp),y,oWall))
	{
		x = x + sign(hsp);
	}
	hsp = 0; 
}
x = x + hsp; 

//Vertical Collision
if (place_meeting(x,y+vsp,oWall))
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0; 
}
y = y + vsp;

//Animation 
if (!place_meeting(x,y+1,oWall))  // not touching the wall (on air)
{
	sprite_index = sPlayerA; 
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1; else image_index = 0; 
	
}
else // touching the floor 
{
	canjump = 10;
	if (sprite_index == sPlayerA)
	{
		audio_sound_pitch(snLanding,choose(0.8, 1.0, 1.2));
		audio_play_sound(snLanding,4,false); // when the player is in the air (for the audio playback)
		repeat(5)
		{
			with (instance_create_layer(x,bbox_bottom,"Bullets",oDust))
			{
				vsp = 0;
			}
		}
	}
	image_speed = 1;
	if (hsp == 0)
	{
		sprite_index = sPlayer; 
		
	}
	else
	{
		sprite_index = sPlayerR;
		
	}
}

if (hsp != 0) image_xscale = sign(hsp);

// Start of the wall jump codes ---------------WAll jump--------------------

// Calculate horizontal movement
walljumpdelay = max(walljumpdelay-1,0);
if (walljumpdelay == 0)
{
	var dir = key_right - key_left;
	hsp += dir * hsp_acc;
	if (dir == 0)
	{
		var hsp_fric_final = hsp_fric_ground;
		if (!onground) hsp_fric_final = hsp_fric_air;
		hsp = Approach(hsp,0,hsp_fric_final);
	}

	hsp = clamp(hsp,-hsp_walk,hsp_walk);
}

// Wall jump
if (onwall != 0) && (!onground) && (key_jump)
{
	walljumpdelay = walljumpdelay_max;
	hsp = -onwall * hsp_wjump;
	vsp = vsp_wjump;
	
	hsp_frac = 0;
	vsp_frac = 0;
	
}
// Calculate vertical movement - redundant code done above
var grv_final = grv;
var vsp_max_final = vsp_max;
if (onwall != 0) && (vsp > 0)
{
	grv_final = grv_wall;
	vsp_max_final = vsp_max_wall;
}
vsp += grv_final + gunkicky;
gunkicky = 0;
vsp = clamp(vsp,-vsp_max_final,vsp_max_final)


// Ground jump
if (jumpbuffer > 0)
{
	jumpbuffer --;
	if (key_jump)
	{
	jumpbuffer = 0;
	vsp = vsp_jump;
	vsp_frac = 0;
	}	
}
vsp = clamp(vsp,-vsp_max,vsp_max)

// Dump fractions and get final integer speed
hsp += hsp_frac;
vsp += vsp_frac;
hsp_frac = frac(hsp);
vsp_frac = frac(vsp);
hsp -= hsp_frac;
vsp -= vsp_frac;

// Horizontal Collision
if (place_meeting(x+hsp,y,oWall))
{
	var onepixel = sign(hsp);
	while (!place_meeting(x+onepixel,y,oWall)) x += onepixel;
	hsp = 0;
	hsp_frac = 0;
}

// Calculate horizontal move - redundant code from above 

// Calculate current status 
onground = place_meeting(x,y+1,oWall);
onwall = place_meeting(x+1,y,oWall) - place_meeting(x-1,y,oWall);
if (onground) jumpbuffer = 6; 

// Adjust sprite
image_speed = 1;
if (hsp != 0) image_xscale = sign(hsp);
if (!onground)
{
	if (onwall != 0)
	{
		sprite_index = sPlayerW
		image_xscale = onwall;
		
		var side = bbox_left;
		if (onwall == 1) side = bbox_right;
		dust ++;
		if ((dust > 2) && (vsp > 0)) with (instance_create_layer(side, bbox_top, "Bullets", oDust))
		{
			other.dust = 0;
			hspeed = -other.onwall*0.5;
		}
		
	}
	else
	{
		dust = 0;
		sprite_index = sPlayerA;
		image_speed = 0;
		image_index = (vsp > 0);
	}
}	
else
{
	if (hsp != 0) sprite_index = sPlayerR; else sprite_index = sPlayer; 
}

// Die if health < .25
if global.playerHealth < .25
{
	instance_change(oPDead,true);

	direction = point_direction(other.x,other.y,x,y);
	hsp = lengthdir_x(6,direction);
	vsp = lengthdir_y(4,direction)-2; 
	if (sign(hsp) != 0) image_xscale = sign(hsp); 
}