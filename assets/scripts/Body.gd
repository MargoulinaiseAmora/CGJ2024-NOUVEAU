extends KinematicBody2D

const UP = Vector2(0, -1)
const PUSH = 100
export var GRAVITY = 20
export var SPEED = 250
export var JUMP_HEIGHT = -600
var jumped = false

var motion = Vector2()

var hit_the_ground = false

func _ready():
	$AnimationTree.get("parameters/playback").start("Idle")

func _physics_process(delta):
	motion.y += GRAVITY
	
	if !get_parent().meditating:
		motion = move_and_slide(motion, UP, false, 4, PI/4, false)
	
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider is MovableBlock: 
			collision.collider.slide(-collision.normal * PUSH) 

	if Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		if(!get_parent().meditating):
			$AnimatedSprite.flip_h = true;
			$AnimationTree.get("parameters/playback").travel("Walk")
	elif Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		if(!get_parent().meditating):
			$AnimatedSprite.flip_h = false;
			$AnimationTree.get("parameters/playback").travel("Walk")
	else:
		motion.x = 0
		$AnimationTree.get("parameters/playback").travel("Idle")
	
	if is_on_floor():
		var meditation = get_parent().meditating
		if jumped && !meditation:

			$AnimationTree.get("parameters/playback").travel("Land")
			jumped = false

		motion.y = 0	
		if Input.is_action_just_pressed("ui_up") || Input.is_action_just_pressed("ui_select"):
			jumped = true
			motion.y = JUMP_HEIGHT
			if !meditation:
				SoundEffectManager.play_sound_effect("jump")
			
	else:
		if jumped:
			$AnimationTree.get("parameters/playback").travel("Jump")
			
		motion.y += GRAVITY
