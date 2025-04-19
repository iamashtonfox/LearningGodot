extends Node2D

const SPEED = 40

@onready var right_checker: RayCast2D = $RightChecker
@onready var left_checker: RayCast2D = $LeftChecker
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var down_checker: RayCast2D = $DownChecker
@onready var down_checker_2: RayCast2D = $DownChecker2

var direction = 1

		
func _process(delta: float) -> void:
	if right_checker.is_colliding():
		direction = -1
		sprite.flip_h = true
	if left_checker.is_colliding():
		direction = 1
		sprite.flip_h = false
	position.x += SPEED * direction * delta
	if not down_checker.is_colliding():
		position.y += 25 * delta
	if down_checker.is_colliding() && down_checker_2.is_colliding():
		position.y -= 25*delta
	
