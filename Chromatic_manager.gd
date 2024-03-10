extends Node2D

var offsetsx = [0,-16]
var offsetsy = [0,16]

var counter = 0

@export var red: Node
@export var green: Node
@export var blue: Node

@export var red_player: Node
@export var green_player: Node
@export var blue_player: Node

@export var music: Node

var rnjesus = RandomNumberGenerator.new()

func _ready():
	
	$Audio.set_stream(load("res://sounds/kick.wav"))
	$Audio.playing=true

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
		
	if event.is_action_pressed("smash"):
		
		get_node("../Camera2D").trauma = 0.5
		
		var sound = rnjesus.randi_range(1,3)
		if sound == 1:
			$Audio.set_stream(load("res://sounds/smash1.wav"))
		elif sound == 2:
			$Audio.set_stream(load("res://sounds/smash2.wav"))
		else :
			$Audio.set_stream(load("res://sounds/smash3.wav"))
		$Audio.playing=true
		
		if counter == offsetsx.size()-1:
			counter = 0
			
			
			
			var collision = red_player.move_and_collide(Vector2(0, 0.1))
			if collision:
				if collision.get_collider() == red:
					red_player.position -= Vector2(offsetsx[counter+1],offsetsy[counter+1]) 
					
			
			#collision = blue_player.move_and_collide(Vector2(0, 0.1))
			#if collision:
			#	if collision.get_collider() == blue:
			#		blue_player.position -= Vector2(offsetsx[counter+1],offsetsy[counter+1]) 
				
			red.position = Vector2(0,0)
			#blue.position = Vector2(0,0)
			
		else:
			counter += 1
			
			
			var collision = red_player.move_and_collide(Vector2(0, 0.1))
			if collision:
				if collision.get_collider() == red:
					red_player.position += Vector2(offsetsx[counter],offsetsy[counter])
					
			
			#collision = blue_player.move_and_collide(Vector2(0, 0.1))
			#if collision:
			#	if collision.get_collider() == blue:
			#		blue_player.position += Vector2(offsetsx[counter],offsetsy[counter])
			
			red.position += Vector2(offsetsx[counter],offsetsy[counter])
			#blue.position += Vector2(offsetsx[counter],offsetsy[counter])
			
					
					
	if event.is_action_pressed("reset"):
		Globals.musicProgress  = music.get_playback_position() 
		get_tree().reload_current_scene()
