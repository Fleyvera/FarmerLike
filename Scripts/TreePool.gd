extends Node2D



func spawnTree(valor):
	return get_children()[valor].duplicate()

func spawnRandomTree():
	return get_children()[rand_range(0 , get_children().size()) ].duplicate()


func _ready():
	
	
	
	pass 



func _process(delta):
	
	
	pass
