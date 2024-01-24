extends Node2D

export var meditating = false;

func _process(delta):
	$Spirit.visible = meditating
	if !$Body.is_on_floor():
		meditating = false
	elif Input.is_action_just_pressed("ui_select"):
		meditating = !meditating
		if meditating:
			$Spirit.position = $Body.position

func reset_position():
	$Spirit.position = Vector2.ZERO
	$Body.position = Vector2.ZERO
