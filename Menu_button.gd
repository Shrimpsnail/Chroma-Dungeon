extends TextureButton



func _ready():
	grab_focus()
	
func _process(a):
	
	$Sprite.visible = has_focus() and not disabled

