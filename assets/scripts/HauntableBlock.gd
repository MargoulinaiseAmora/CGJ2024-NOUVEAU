extends KinematicBody2D
class_name HauntableBlock

var speed = 150
var gravity = 25
var velocity = Vector2.ZERO
export var haunted = false

func _physics_process(delta):
	if !is_on_floor():
		velocity.y = max(velocity.y + gravity, 250)
	else:
		velocity.y = 0 
	
	if haunted:
		if Input.is_action_pressed("ui_left"):
			velocity.x -= speed
		if Input.is_action_pressed("ui_right"):
			velocity.x += speed
		
	velocity = move_and_slide(velocity)
	velocity.x = 0

func highlight():
	print("highlighted")

func lowlight():
	print("lowlighted")
