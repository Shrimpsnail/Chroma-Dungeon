extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -300.0

var move = false
@export var tilemap: Node
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	if move == true:
		velocity.x = -1 * SPEED

	if velocity.y < 0:
		$dog_sprite.play("jump")
	
	elif velocity.y > 0:
		$dog_sprite.play("fall")

	move_and_slide()


func _on_dog_sprite_animation_finished():
	$dog_sprite.play("bark")


func _on_movestart_timer_timeout():
	move = true
	velocity.y = JUMP_VELOCITY
	$sounds2.set_stream(load("res://sounds/jump.wav"))
	$sounds2.playing=true


func _on_area_2d_body_entered(body):
		if body.is_in_group("Player"):
			var next_scene = load("res://thanks.tscn").instantiate()
			get_tree().root.add_child(next_scene)
			get_tree().set_current_scene(next_scene)
			get_node("/root/lvl_end").free()
