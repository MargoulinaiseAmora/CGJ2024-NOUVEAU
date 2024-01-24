extends Node2D
class_name GenericLevel

export var tileMap : NodePath

export var start : NodePath
onready var startNode = get_node(start)

export var end : NodePath
onready var endNode : End = get_node(end)

signal end_touched

export(Array, NodePath) var elements := []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func getStartPos():
	return startNode.global_position

func _on_End_body_entered(body):
	emit_signal("end_touched")
