extends KinematicBody2D

export var speed = 400
export var acceleration = 0.1
export var deceleration = 0.04
export var velocity = Vector2()
export var haunting = false
var haunt_target
onready var limit_zone = get_parent().get_node("LimitZone")
onready var shapeRadius = limit_zone.get_node("CollisionShape2D").shape.radius

func get_input():
	if !haunting:
		var target_velocity = Vector2()
		if Input.is_action_pressed('ui_right'):
			target_velocity.x += 1
		if Input.is_action_pressed('ui_left'):
			target_velocity.x -= 1
		if Input.is_action_pressed('ui_down'):
			target_velocity.y += 1
		if Input.is_action_pressed('ui_up'):
			target_velocity.y -= 1
		target_velocity = target_velocity.normalized() * speed
		
		spirit_movement_effect(target_velocity)
	
	if Input.is_action_just_pressed("ui_possess"):
		toggle_haunt()

func _physics_process(delta):
	if get_parent().meditating:
		get_input()
		move_and_collide(velocity * delta)

func toggle_haunt():
	if haunting:
		haunting = false
		visible = true
		global_position = haunt_target.global_position
		haunt_target.haunted = false
	elif (haunt_target != null):
		haunting = true
		visible = false
		haunt_target.haunted = true

func _on_HauntDetection_body_entered(body):
	haunt_target = body
	haunt_target.highlight()

func _on_HauntDetection_body_exited(body):
	if !haunting:
		haunt_target.lowlight()
		haunt_target = null

		
func launch_spirit(body_direction):
	var direction = 2
	if body_direction:
		direction = -2
	
	var target_velocity = Vector2(direction, -1)
	target_velocity = target_velocity.normalized() * 1600
	spirit_movement_effect(target_velocity)
		
func spirit_movement_effect(target_velocity):
	if target_velocity == Vector2.ZERO:
		velocity = velocity.linear_interpolate(Vector2.ZERO, deceleration)
	else:
		velocity = velocity.linear_interpolate(target_velocity, acceleration)
	
	
