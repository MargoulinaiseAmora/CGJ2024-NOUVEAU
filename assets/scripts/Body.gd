extends KinematicBody2D

const UP = Vector2(0, -1)
export var GRAVITY = 20
export var SPEED = 300
export var JUMP_HEIGHT = -500
var jumped = false

var motion = Vector2()

var hit_the_ground = false

func _physics_process(delta):
	
	motion.y += GRAVITY
	
	if Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
	elif Input.is_action_pressed("ui_right"):
		motion.x = SPEED
	else:
		motion.x = 0
	
	if !get_parent().meditating:
		motion = move_and_slide(motion, UP, false)
	
	if is_on_floor():
		$AnimatedSprite.scale = lerp($AnimatedSprite.scale, Vector2(1,1), 0.25)
		if jumped:
			$AnimatedSprite.scale = Vector2(1.35, 0.65)
			jumped = false
		motion.y = 0
		if Input.is_action_just_pressed("ui_up") && !get_parent().meditating:
			jumped = true
			motion.y = JUMP_HEIGHT
	else:
		if jumped:
			$AnimatedSprite.scale = lerp($AnimatedSprite.scale, Vector2(0.75, 1.25), 0.25)
		motion.y += GRAVITY
