extends CharacterBody2D


const SPEED =150.0
const JUMP_VELOCITY = -320.0

var flipped = false
var been_flipped = false

var can_jump = true

var stop = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	
	# Animations #
	if velocity.y > 0:
		$Sprite.play("fall")
		
	elif velocity.y < 0:
		$Sprite.play("jump")
		
	elif (Input.is_action_pressed("right") or Input.is_action_pressed("left")) and not stop:
		$Sprite.play("run")
		if $step_time.time_left == 0 and is_on_floor():
			$step_time.start()
		
	elif velocity == Vector2.ZERO:
		$Sprite.play("idle")
		
	
	#fix teh bug
	
	
	
	
	
	if flipped and not been_flipped:
		scale.x = -1
		been_flipped = true
	if not flipped and been_flipped:
		scale.x = -1
		been_flipped = false
		
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor() and can_jump:
		velocity.y = JUMP_VELOCITY
		
		$Audio.set_stream(load("res://sounds/jump.wav"))
		$Audio.playing=true

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	if not stop:
		var direction = Input.get_axis("left", "right")
		if direction:
			velocity.x = direction * SPEED
			
			if direction<0 and flipped == false:
				flipped=true
			if direction>0 and flipped == true:
				flipped=false
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_push_body_entered(body):
	if(body.is_in_group("Pushable")):
		body.being_pushed=true

func _on_push_body_exited(body):
	if(body.is_in_group("Pushable")):
		body.being_pushed=false


func _on_step_time_timeout():
		if is_on_floor() and Input.is_action_pressed("right") or Input.is_action_pressed("left"):
			$Audio.set_stream(load("res://sounds/step.wav"))
			$Audio.playing=true



func _on_glitch_timeout():
	
	if not is_on_floor() and velocity.y == 0:
		position.y += 16


func _on_glitch_body_entered(body):
	#if not body.is_in_group("Player"):
		position.y += 8
