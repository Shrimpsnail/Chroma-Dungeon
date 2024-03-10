extends Control

var chromatic = false
@export var title: Node

@export var start_button_timer: Node
@export var exit_button_timer: Node

@export var start_button: Node
@export var exit_button: Node

@export var start_sprite: Node
@export var exit_sprite: Node

var rnjesus = RandomNumberGenerator.new()

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
		
	if event.is_action_pressed("smash"):
		
		
		$Cam.trauma = 0.5
		
		
		if chromatic:	
			title.texture=load("textures/title.png")
			chromatic = false
		else:
			title.texture=load("textures/title_chroma.png")
			chromatic = true
			
		var sound = rnjesus.randi_range(1,3)
		if sound == 1:
			$Audio.set_stream(load("res://sounds/smash1.wav"))
		
		elif sound == 2:
			$Audio.set_stream(load("res://sounds/smash2.wav"))
		else :
			$Audio.set_stream(load("res://sounds/smash3.wav"))
		$Audio.playing=true
	
	if event.is_action_pressed("ui_up") or event.is_action_pressed("ui_down"):
		
		$Audio.set_stream(load("res://sounds/menu_change.wav"))
		$Audio.playing=true

func _on_start_pressed():
	$Audio.set_stream(load("res://sounds/menu_start.wav"))
	$Audio.playing=true
	start_button_timer.start()
	start_sprite.play("run")

	exit_button.disabled = true
	exit_button.set_texture_normal(load("res://textures/empty_Text.png"))

func _on_exit_pressed():
	$Audio.set_stream(load("res://sounds/menu_start.wav"))
	$Audio.playing=true
	exit_button_timer.start()
	exit_sprite.play("run")
	
	start_button.disabled = true
	start_button.set_texture_normal(load("res://textures/empty_Text.png"))


func _on_timer_timeout():
	var next_scene = load("res://level0.tscn").instantiate()
	get_tree().root.add_child(next_scene)
	get_tree().set_current_scene(next_scene)
	get_node("/root/Main_menu").queue_free()


func _on_timer_2_timeout():
	get_tree().quit()
