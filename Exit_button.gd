extends TextureButton


	
func _process(a):
	
	$Sprite.visible = has_focus() and not disabled
