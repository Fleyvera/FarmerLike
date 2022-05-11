extends Node2D


func spawnMap(valor):
	return get_children()[valor].duplicate()

func spawnRandomMap():
	return get_children()[rand_range(0 , get_children().size()) ].duplicate()


func _ready():
	pass



func _process(delta):
	pass
