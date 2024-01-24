extends Area2D

signal player_activated_button
signal player_left_button

func _ready():
	connect("body_entered", self, "_on_body_entered")
	connect("body_exited", self, "_on_body_exited")


func _on_body_entered(body):
	if body.name == "Player":
		get_node("normal").visible = false
		get_node("activated").visible = true
		emit_signal("player_activated_button")
		SoundEffectManager.play_sound_effect("button")

func _on_body_exited(body):
	if body.name == "Player":
		get_node("normal").visible = true
		get_node("activated").visible = false
		emit_signal("player_left_button")
