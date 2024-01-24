extends KinematicBody2D

const UP = Vector2(0, -1)
export var GRAVITY = 20
export var SPEED = 250
export var JUMP_HEIGHT = -500
var jumped = false

var motion = Vector2()

var hit_the_ground = false

func _ready():
	$AnimationTree.get("parameters/playback").start("Idle")

func _physics_process(delta):
	motion.y += GRAVITY
	
	if Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		$AnimatedSprite.flip_h = true;
		$AnimationTree.get("parameters/playback").travel("Walk")
	elif Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		$AnimatedSprite.flip_h = false;
		$AnimationTree.get("parameters/playback").travel("Walk")
	else:
		motion.x = 0
		$AnimationTree.get("parameters/playback").travel("Idle")

		
	motion = move_and_slide(motion, UP, false)
	
	if is_on_floor():
		if jumped:
			$AnimationTree.get("parameters/playback").travel("Land")
			jumped = false
		motion.y = 0	
		if Input.is_action_just_pressed("ui_up") || Input.is_action_just_pressed("ui_select"):
			jumped = true
			motion.y = JUMP_HEIGHT
	else:
		if jumped:
			$AnimationTree.get("parameters/playback").travel("Jump")
			
		motion.y += GRAVITY
