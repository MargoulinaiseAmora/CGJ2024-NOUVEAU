extends Node2D

export var meditating = false;

func _ready():
	$Spirit.visible = false

func _process(delta):
	if !$Body.is_on_floor():
		meditating = false
	elif Input.is_action_just_pressed("ui_meditate") && !$Spirit.haunting:
		meditating = !meditating
		changeTrack()
		if meditating:
			SoundEffectManager.play_sound_effect("inspire")
			$Spirit.position = $Body.position
			$Spirit.velocity = Vector2()
			$Spirit.visible = true
		else:
			$Spirit.visible = false
			SoundEffectManager.play_sound_effect("expire")

func reset_position():
	$Spirit.position = Vector2.ZERO
	$Body.position = Vector2.ZERO

func changeTrack():
	var musicNode = get_parent().get_node("MusicManager")
	musicNode.call("playTrack", meditating)
