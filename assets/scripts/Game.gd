extends Node2D
class_name Game

onready var levels: Array = $Levels.get_children()


export(PackedScene) var pauseScene
export var currentLevelIndex = 0
var pause = null

func getCurrentLevel() -> GenericLevel:
	return levels[currentLevelIndex]

func resetLevel():
	$Player.position = getCurrentLevel().getStartPos()
	$Player.reset_position()
	$Camera2D.position.x = 1034 * currentLevelIndex

func nextLevel():
	print("Prochain niveauu")
	
	currentLevelIndex = (currentLevelIndex + 1) % levels.size()
	
	print($Player.position)
	
	resetLevel()

func prevLevel():
	currentLevelIndex = (currentLevelIndex + 1) % levels.size()
	resetLevel()

# Called when the node enters the scene tree for the first time.
func _ready():
	
	var indent = 0
	for level in levels:
		level.position.x += indent
		indent += 1034
	
	resetLevel()

func _process(delta):
	if (Input.is_action_pressed("ui_cancel") && !get_tree().paused):
		pause = pauseScene.instance()
		add_child(pause)
		
	#if (Input.is_action_pressed("ui_cancel")):
		#resetLevel()



func _on_Levels_end_touched():
	nextLevel()
