extends Node2D

@export var blue: Node
@export var green: Node

func _process(delta):
	green.position = blue.position
