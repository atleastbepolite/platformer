// Draw Health

var _playerHealth = global.playerHealth;
var _playerHealthMax = global.playerHealthMax;
var _playerHealthFrac = frac(_playerHealth);
_playerHealth -= _playerHealthFrac;

for (var i = 1; i <= _playerHealthMax; i++)
{
	var _imageIndex = (i > _playerHealth);
	if (i == _playerHealth+1)
	{
		_imageIndex += (_playerHealthFrac > 0)
		_imageIndex += (_playerHealthFrac > .25) 
		_imageIndex += (_playerHealthFrac > .5)
	}
	
	draw_sprite(sHeart, _imageIndex, UI_MARGIN + ((i-1) * UI_HEALTHSEPARATION), UI_MARGIN)
	draw_sprite(sDiamond,_imageIndex, UI_MARGIN, UI_MARGIN * 2) 
	draw_sprite(sDiamondG,_imageIndex, UI_MARGIN * 1.7, UI_MARGIN *2)
}