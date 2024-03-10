extends ColorRect


@export var camera: Node

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		material.set("shader_param/aberration",camera.trauma*0.1)
		
