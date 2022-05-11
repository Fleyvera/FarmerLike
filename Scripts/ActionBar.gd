extends Node2D


export (float) var time


func _ready():
	
	$ProgressBar.max_value = time
	
	pass 



func _process(delta):
	
	
	$ProgressBar.value += delta
	
	if $ProgressBar.value == $ProgressBar.max_value:
		queue_free()
	
	pass
