extends Node2D

#Numero dos filhos
#1 - MainHouse


func spawnStructure(valor):
	return get_children()[valor].duplicate()

func spawnRandomStructure():
	return get_children()[rand_range(0 , get_children().size()) ].duplicate()


func _ready():
	pass 


#
#func _process(delta):
#	pass

