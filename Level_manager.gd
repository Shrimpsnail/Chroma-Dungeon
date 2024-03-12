extends Node2D


@export var toggle1: Node
@export var switch1: Node
var switch1_player = false
var switch1_crate = false


@export var switch2: Node
var switch2_player = false
var switch2_crate = false

@export var disabled_tiles: Node
@export var door1: Node
@export var door2: Node

var toggled = false
func _on_toggle_1_body_entered(body):
	if((body.is_in_group("Player") or body.is_in_group("Pushable")) and not toggled):
		toggle1.get_node("AnimatedSprite2D").play("on")
		disabled_tiles.position.x = 0
		$Audio.set_stream(load("res://sounds/switch.wav"))
		$Audio.playing=true
		toggled = true




func _on_switch_body_entered(body):
	if(body.is_in_group("Player")):
		switch1.get_node("AnimatedSprite2D").play("on")
		door1.position.x = 1008
		switch1_player=true
		
		if not switch1_crate:
			$Audio.set_stream(load("res://sounds/switch.wav"))
			$Audio.playing=true
		
	
	if(body.is_in_group("Pushable")):
		switch1.get_node("AnimatedSprite2D").play("on")
		door1.position.x = 1008
		switch1_crate=true
		
		if not switch1_player:
			$Audio.set_stream(load("res://sounds/switch.wav"))
			$Audio.playing=true


func _on_switch_body_exited(body):
	if body.is_in_group("Player"):
		if not switch1_crate:
			switch1.get_node("AnimatedSprite2D").play("default")
			door1.position.x = 0
			$Audio.set_stream(load("res://sounds/switch.wav"))
			$Audio.playing=true
		switch1_player = false
	
		
		
	if(body.is_in_group("Pushable")):
		if not switch1_player:
			switch1.get_node("AnimatedSprite2D").play("default")
			door1.position.x = 0
			$Audio.set_stream(load("res://sounds/switch.wav"))
			$Audio.playing=true
		switch1_crate = false




func _on_switch_2_body_entered(body):
	if(body.is_in_group("Player")):
		switch2.get_node("AnimatedSprite2D").play("on")
		door2.position.x = 1008
		switch2_player=true
		
		if not switch2_crate:
			$Audio.set_stream(load("res://sounds/switch.wav"))
			$Audio.playing=true
		
	
	if(body.is_in_group("Pushable")):
		switch2.get_node("AnimatedSprite2D").play("on")
		door2.position.x = 1008
		switch2_crate=true
		
		if not switch2_player:
			$Audio.set_stream(load("res://sounds/switch.wav"))
			$Audio.playing=true

func _on_switch_2_body_exited(body):
	if body.is_in_group("Player"):
		if not switch2_crate:
			switch2.get_node("AnimatedSprite2D").play("default")
			door2.position.x = 0
			$Audio.set_stream(load("res://sounds/switch.wav"))
			$Audio.playing=true
		switch2_player = false
	
		
		
	if(body.is_in_group("Pushable")):
		if not switch2_player:
			switch2.get_node("AnimatedSprite2D").play("default")
			door2.position.x = 0
			$Audio.set_stream(load("res://sounds/switch.wav"))
			$Audio.playing=true
		switch2_crate = false
