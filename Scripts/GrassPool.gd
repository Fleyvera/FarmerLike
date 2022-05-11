extends Node2D



func spawnGrass(valor):
	return get_children()[valor].duplicate()

func spawnRandomGrass():
	return get_children()[rand_range(0 , get_children().size()) ].duplicate()


func _ready():
	
	
	
	pass 



func _process(delta):
	
	
	pass
