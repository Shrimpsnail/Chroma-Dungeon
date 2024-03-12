extends ColorRect


func _input(event):
	
	if event.is_action_pressed("controls"):
		visible = true

	if event.is_action_released("controls"):
		visible = false
