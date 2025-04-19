extends CharacterBody2D


const SPEED = 125.0
const JUMP_VELOCITY = -325.0
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if velocity.y < 0:
		sprite.play('jumping')
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Move_left", "Move_right")
	var walking := Input.is_action_pressed("walk")
	
	if direction > 0:
		sprite.flip_h = false
	elif direction < 0:
		sprite.flip_h = true
	if is_on_floor():	
		if direction == 0:
			sprite.play("idle")
		else:
			sprite.play("run")
	else:
		sprite.play("jumping")
		
	if direction && walking:
		sprite.speed_scale = .5
		velocity.x = direction * SPEED/2
	else:
		sprite.speed_scale = .5
		velocity.x = direction * SPEED
		
	move_and_slide()
