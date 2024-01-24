extends Node2D

export var meditating = false;

var time = 0
var timeDirection = 1
var moveDuration = 200

func _process(delta):
	if !$Body.is_on_floor():
		meditating = false
		$Spirit.position = $Body.position
	elif Input.is_action_just_pressed("ui_meditate"):
		meditating = !meditating
		changeTrack()
		if meditating:
			SoundEffectManager.play_sound_effect("inspire")	
			$Spirit.visible = true
			$Spirit.launch_spirit($Body.get_node("AnimatedSprite").flip_h)
			
			#$Spirit.position = $Body.position
			#$Spirit.velocity = Vector2()
		else:
			SoundEffectManager.play_sound_effect("expire")
	
	if !meditating:
		if (time > moveDuration or time < 0):
			timeDirection *= -1
		time += delta * timeDirection
		var t = time / moveDuration
		$Spirit.position = lerp($Spirit.position,$Body.position, t)
	if $Spirit.position.x <= $Body.position.x +10 && $Spirit.position.x >= $Body.position.x -10 && $Spirit.position.y <= $Body.position.y +10 && $Spirit.position.y >= $Body.position.y -10 && !meditating:
		$Spirit.visible = false	

func reset_position():
	$Spirit.position = Vector2.ZERO
	$Body.position = Vector2.ZERO

func changeTrack():
	var musicNode = get_parent().get_node("MusicManager")
	musicNode.call("playTrack", meditating)
