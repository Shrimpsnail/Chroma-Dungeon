extends Node2D

@export var blue: Node
@export var green: Node

@export var cblue: Node
@export var cgreen: Node

func _process(delta):
	green.position = blue.position
	cgreen.position = cblue.position
