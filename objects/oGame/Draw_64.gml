/// @description Draw Score

if (room != rMenu) && (instance_exists(oPlayer)) && (global.kills > 0)
{
	killtextscale = max(killtextscale * 0.95, 1);
	DrawSetText(c_black, fMenu, fa_right, fa_top);
	draw_text_transformed(RES_W - 8, 12, string(global.kills) + " BUG CUTS!!!", killtextscale, killtextscale, 0); // shadow
	draw_set_colour(c_white);
	draw_text_transformed(RES_W - 10, 10, string(global.kills) + " BUG CUTS!!!", killtextscale, killtextscale, 0); // white text on top 
}


if (room != rMenu) && (instance_exists(oPlayer)) && (global.diamonds > 0)
{
	
	DrawSetText(c_black, fMenu, fa_right, fa_top);
	draw_text_transformed(UI_MARGIN * 2.67, UI_MARGIN * 1.63, string(global.diamonds) , diamondtextscale, diamondtextscale, 0); // shadow
	draw_set_colour(c_white);
	draw_text_transformed((UI_MARGIN * 2.67) -2, (UI_MARGIN * 1.63) -2, string(global.diamonds), diamondtextscale, diamondtextscale, 0); // white text on top 

}
