extends Node2D

@export var player: Node

@export var camera: Node

@export var demon: Node
@export var dog: Node

var counter = 1
func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		player.stop = true
		player.velocity = Vector2.ZERO
		
		demon.visible=true
		
		demon.play("appear")
		
		$stepTimer.start()


func _on_step_timer_timeout():
	
	
	if counter != 4:
		
		$sounds.set_stream(load("res://sounds/smash2.wav"))
		$sounds.playing=true
		camera.trauma=counter*0.3
	else:
		$sounds.set_stream(load("res://sounds/step.wav"))
		$sounds.playing=true
		camera.trauma=0.3
		
		$stepTimer.stop()
		demon.visible=false
		dog.visible = true
		dog.get_node("dog_sprite").play("stil")
		$barkTimer.start()
		$barkendTimer.start()
		$movestartTimer.start()
		
		
	counter+= 1


func _on_dog_sprite_animation_finished():
	if dog.get_node("dog_sprite").animation == "stil":
		dog.get_node("dog_sprite").play("bark")


func _on_bark_timer_timeout():
		$sounds.set_stream(load("res://sounds/bark.wav"))
		$sounds.playing=true


func _on_barkend_timer_timeout():
		dog.get_node("dog_sprite").play("standup")
		$sounds.set_stream(load("res://sounds/step.wav"))
		$sounds.playing=true
