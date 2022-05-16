extends Node2D


var isOverlapping
var notBuilded = true

var isBuildable = false

func _ready():
	pass



func _process(delta):
	
	
	if notBuilded:
		var isOverlapping = get_parent().get_node("Area2D").get_overlapping_areas()
	
		if isOverlapping.size() == 1:
			isBuildable = true
		else:
			isBuildable = false
		
		print(isOverlapping)
	pass





