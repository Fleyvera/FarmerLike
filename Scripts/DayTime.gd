extends Node2D


var dayTime = 0
var setDayTime = 60

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _process(delta):
	
	dayTime += delta
	if dayTime >= setDayTime:
		dayTime = 0
	
	$Hud/ProgressBar.value = dayTime
	$Hud/ProgressBar.max_value = setDayTime
	
	
	pass
