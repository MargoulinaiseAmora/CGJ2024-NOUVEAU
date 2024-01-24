extends Node2D


signal end_touched

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Level3_end_touched():
	emit_signal("end_touched")

func _on_Level2_end_touched():
	emit_signal("end_touched")

func _on_Level1_end_touched():
	emit_signal("end_touched")
