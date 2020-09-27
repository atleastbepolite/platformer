#macro RES_W 1360
#macro RES_H 768

display_set_gui_size(RES_W,RES_H)

global.hasgun = false; 
global.kills = 0;
global.killsthisroom = 0;
killtextscale = 1;
 
//Player health setting
global.playerHealthMax = PLAYER_STARTHEALTH;
global.playerHealth = 5;

//Diamonds collected

diamondtextscale = 0.8
global.hasdiamonds = false;
global.diamonds = 0;
