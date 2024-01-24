extends Node2D

var scroll_x = 0
var scroll_y = 0

func _process(delta):	
	scroll_x -= 8 * delta
	scroll_y -= 1 * delta
	$ParallaxBackground.scroll_offset.x = scroll_x
	$ParallaxBackground.scroll_offset.y = scroll_y
	$ParallaxBackground2.scroll_offset.x = scroll_x
	$ParallaxBackground2.scroll_offset.y = scroll_y
	
