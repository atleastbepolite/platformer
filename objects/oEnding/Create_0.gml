gunsprite = layer_sprite_get_id("Player","gGun")
if (global.hasgun == true) && (global.kills > 0)
{
	endtext[0] = "Thank you for trying out my first platformer game";	
	endtext[1] = "Hope you enjoyed it!!!";
	endtext[2] = "Special thanks to...";
	endtext[3] = "JoJoMonkey";
	endtext[4] = "BUG";
	endtext[5] = "CUT";
	endtext[6] = "The End.";	
}
else
{
	endtext[0] = "Thank you for trying out my first platformer game";	
	endtext[1] = "Hope you enjoyed it!!!";
	endtext[2] = "Special thanks to...";
	endtext[3] = "JoJoMonkey";
	endtext[4] = "BUG";
	endtext[5] = "CUT";
	endtext[6] = "The End.";	
}

spd = 0.5;
letters = 0;
currentline = 0;
length = string_length(endtext[currentline]);
text = "";


