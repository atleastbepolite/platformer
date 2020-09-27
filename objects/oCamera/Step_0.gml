/// @description Update camera 


//Update destination 
if (instance_exists(follow))
{
	xTo = follow.x;
	yTo = follow.y; 
	
	if ((follow).object_index == oPDead)
	{
		x = xTo;
		y = yTo; 
	}
}

//Update object position 
x += (xTo - x) / 25;
y += (yTo - y) / 25;

//Keep camera center inside room 
x = clamp(x,view_w_half+buff,room_width-view_w_half-buff);   
y = clamp(y,view_h_half+buff,room_height-view_h_half-buff);

//Screen Shake
x += random_range(-shake_remain,shake_remain);
y += random_range(-shake_remain,shake_remain);
shake_remain = max(0,shake_remain-((1/shake_length)*shake_magnitude));

//Update camera view

camera_set_view_pos(cam,x-view_w_half,y-view_h_half);

if (room != rMenu) && (room != RoomE) && (room != Room2A)
{
	if (layer_exists("Backgrounds_2"))
	{
		layer_x("Backgrounds_2",(x/2));
	}
	if (layer_exists("Backgrounds_3"))
	{
		layer_x("Backgrounds_3",(x/3));
	}
	if (layer_exists("Backgrounds_4"))
	{
		layer_x("Backgrounds_4",(x/4));
	}
	if (layer_exists("Backgrounds_5"))
	{
		layer_x("Backgrounds_5",x/5);
	}
	if (layer_exists("Backgrounds_6"))
	{
		layer_x("Backgrounds_6",(x/6));
	}
}

if (room == Room2A)
{
	if (layer_exists("Backgrounds_3"))
	{
		layer_x("Backgrounds_3",(x/1.2));
	}
	if (layer_exists("Backgrounds_4"))
	{
		layer_x("Backgrounds_4",(x/1.4));
	}
	if (layer_exists("Backgrounds_5"))
	{
		layer_x("Backgrounds_5",(x/1.6));
	}
	if (layer_exists("Backgrounds_2"))
	{
		layer_x("Backgrounds_2",x/1.8);
	}
}
