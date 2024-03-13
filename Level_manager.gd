extends Node2D


@export var toggle1: Node

@export var toggle2: Node

@export var toggle3: Node

@export var door1: Node
@export var door2: Node
@export var door3: Node

func _on_toggle_1_body_entered(body):
	if body.is_in_group("Player") or body.is_in_group("Pushable"):
		
		toggle1.get_node("AnimatedSprite2D").play("on")
		
		door1.position.x = 1008
		
		$Audio.set_stream(load("res://sounds/switch.wav"))
		$Audio.playing=true

func _on_toggle_2_body_entered(body):
	if body.is_in_group("Player") or body.is_in_group("Pushable"):
		
		toggle2.get_node("AnimatedSprite2D").play("on")
		
		door2.position.x = 1008
		
		$Audio.set_stream(load("res://sounds/switch.wav"))
		$Audio.playing=true
func _on_toggle_3_body_entered(body):
	if body.is_in_group("Player") or body.is_in_group("Pushable"):
		
		toggle3.get_node("AnimatedSprite2D").play("on")
		
		door3.position.x = 1008
		
		$Audio.set_stream(load("res://sounds/switch.wav"))
		$Audio.playing=true
