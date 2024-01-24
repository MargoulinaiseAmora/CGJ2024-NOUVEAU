extends Node2D

export var buttonPath : NodePath
onready var button = get_node(buttonPath)

export var doorPath : NodePath
onready var door = get_node(doorPath)

func _ready():
	button.connect("player_activated_button", self, "_on_button_player_activated_button")
	button.connect("player_left_button", self, "_on_button_player_left_button")


func _on_button_player_activated_button():
	door.call("open")

func _on_button_player_left_button():
	door.call("close")

