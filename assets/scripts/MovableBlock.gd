extends KinematicBody2D
class_name MovableBlock

var gravity = 25
var velocity = Vector2.ZERO

export var size : float = 64

func _ready():
	$Sprite.scale = Vector2(size/512.0, size/512.0)
	$CollisionShape2D.shape.extents = Vector2(size/2.0, size/2.0)

func _physics_process(delta):
	if !is_on_floor():
		velocity.y = max(velocity.y + gravity, 250)
	else:
		velocity.y = 0 
		
	velocity = move_and_slide(velocity)
	velocity.x = 0

func slide(vector):
	velocity.x = vector.x
