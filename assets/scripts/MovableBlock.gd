extends KinematicBody2D
class_name MovableBlock

var gravity = 100

var velocity = Vector2.ZERO

func _physics_process(delta):
	if !is_on_floor():
		velocity.y += gravity
	else:
		velocity.y = 0 
		
	
	velocity = move_and_slide(velocity)
	velocity.x = 0
	
		

	
func slide(vector):
	velocity.x = vector.x
