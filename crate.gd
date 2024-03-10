extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = 0

var being_pushed = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	if being_pushed and is_on_floor():
		var direction = Input.get_axis("left", "right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			
	if not being_pushed or not is_on_floor():
		velocity.x = 0

	move_and_slide()
