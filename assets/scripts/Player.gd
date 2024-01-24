extends Node2D

export var meditating = false;

func _process(delta):
	$Spirit.visible = meditating
	if !$Body.is_on_floor():
		meditating = false
	elif Input.is_action_just_pressed("ui_meditate"):
		meditating = !meditating
		if meditating:
			SoundEffectManager.play_sound_effect("inspire")
			$Spirit.position = $Body.position
			$Spirit.velocity = Vector2()
		else:
			SoundEffectManager.play_sound_effect("expire")

func reset_position():
	$Spirit.position = Vector2.ZERO
	$Body.position = Vector2.ZERO
