extends KinematicBody2D

const UP = Vector2(0, -1)

var velocity = Vector2()
var gravity = 1400
var speed = 10*16
var jump_height = 30*16

var is_grounded
var direction

func _physics_process(delta):
	_get_input()
	velocity.y += gravity * delta
	
	is_grounded = is_on_floor()
	velocity = move_and_slide(velocity, UP)

# warning-ignore:unused_argument
func _input(event):
	if Input.is_action_pressed("ui_up") && is_grounded:
		velocity.y -= jump_height

func _get_input():
	direction = -int(Input.is_action_pressed("ui_left")) + int(Input.is_action_pressed("ui_right"))
	velocity.x = lerp(velocity.x, speed * direction, 0.2)
	
	if direction != 0:
		$AnimatedSprite.scale.x = direction
