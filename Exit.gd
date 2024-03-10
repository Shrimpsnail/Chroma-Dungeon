extends Node2D

@export var next_level = "level1"

@export var red_player: Node
@export var green_player: Node
@export var blue_player: Node

@export var music: Node

var red = false
var green = false
var blue = false

	
	
func check():
	
	if(red and blue and green):
		Globals.musicProgress  = music.get_playback_position() 
		var next_scene = load("res://level1.tscn").instantiate()
		get_tree().root.add_child(next_scene)
		get_tree().set_current_scene(next_scene)
		get_node("/root/lvl0").free()
		

func _on_area_2d_body_entered(body):
	if(body == red_player):
		red = true
		check()
		
	elif(body == green_player):
		green = true
		check()
		
	elif(body == blue_player):
		blue = true
		check()


func _on_area_2d_body_exited(body):
	if(body == red_player):
		red = false
		
	elif(body == green_player):
		green = false
		
	elif(body == blue_player):
		blue = false
